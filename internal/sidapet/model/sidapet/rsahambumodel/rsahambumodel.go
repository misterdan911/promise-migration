package rsahambumodel

import (
	"context"
	"database/sql"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
	"promise-migration/internal/sidapet/structs"
	"strconv"
)

type VmsTblSaham struct {
	IdSaham          pgtype.Int4
	IdProfilPenyedia pgtype.Int4
	NmSaham          pgtype.Text
	NoKtpSaham       pgtype.Text
	AlamatSaham      pgtype.Text
	PersentaseSaham  pgtype.Text
	PathSaham        pgtype.Text
}

func InsertrefSahamBu(profilePenyedia structs.TblProfilePenyedia) {

	if profilePenyedia.IdJenisPenyedia.Int32 == 2 {
		return
	}

	ctx := context.Background()

	qVmsTblSaham := `
	  SELECT
		id_saham,
		id_profil_penyedia,
		nm_saham,
		no_ktp_saham,
		alamat_saham,
		persentase_saham,
		path_saham
	  FROM tbl_saham_perusahaan
	  WHERE id_profil_penyedia = $1
	  ORDER BY id_saham`

	rVTS, errVTK := db.VmsDb.Query(ctx, qVmsTblSaham, strconv.Itoa(int(profilePenyedia.IdProfilPenyedia.Int32)))
	if errVTK != nil {
		log.Fatal("qVmsTblSaham Failed, " + errVTK.Error() + " " + qVmsTblSaham)
	}

	allVTS, errCollect := pgx.CollectRows(rVTS, pgx.RowToStructByName[VmsTblSaham])
	if errCollect != nil {
		log.Fatal("failed collecting rows, " + errCollect.Error())
	}
	defer rVTS.Close()

	for _, vTS := range allVTS {
		qIns := `
		INSERT INTO ref_saham_bu (
		  kode_vendor,
		  nm_saham,
		  no_ktp_saham  ,
		  alamat_saham,
		  persentase_saham,
		  path_saham,
		  is_saham_selamanya
		) VALUES (
		  @kode_vendor,
		  @nm_saham,
		  @no_ktp_saham  ,
		  @alamat_saham,
		  @persentase_saham,
		  @path_saham,
		  @is_saham_selamanya
		)`

		args := pgx.NamedArgs{
			"kode_vendor":        profilePenyedia.IdProfilPenyedia,
			"nm_saham":           vTS.NmSaham,
			"no_ktp_saham":       vTS.NoKtpSaham,
			"alamat_saham":       vTS.AlamatSaham,
			"persentase_saham":   vTS.PersentaseSaham,
			"path_saham":         vTS.PathSaham,
			"is_saham_selamanya": sql.NullBool{}, // Belum tau cara ngedapetinnya
		}

		_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
		if errIns != nil {
			fmt.Println("unable to insert ref_saham_bu, " + errIns.Error())
		}

	}
}
