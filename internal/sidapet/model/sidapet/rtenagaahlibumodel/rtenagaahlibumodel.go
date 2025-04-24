package rtenagaahlibumodel

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

type VmsTblPersonaliaPerush struct {
	IdPersonalia       pgtype.Int4
	IdProfilPenyedia   pgtype.Int4
	NmPersonal         pgtype.Text
	TglPersonal        pgtype.Text
	PendidikanPersonal pgtype.Text
	JbtnPersonal       pgtype.Text
	PengalamanPersonal pgtype.Text
	KeahlianPersonal   pgtype.Text
	SertifPersonal     pgtype.Text
	PathPersonal       pgtype.Text
}

func InsertRefTenagaAhliBu(profilePenyedia structs.TblProfilePenyedia) {
	if profilePenyedia.IdJenisPenyedia.Int32 == 2 {
		return
	}

	ctx := context.Background()

	qVmsTblPersonaliaP := `
	SELECT
	  id_personalia,
	  id_profil_penyedia,
	  nm_personal,
	  tgl_personal,
	  pendidikan_personal,
	  jbtn_personal,
	  pengalaman_personal,
	  keahlian_personal,
	  sertif_personal,
	  path_personal
	FROM tbl_personalia_perusahaan
	WHERE id_profil_penyedia = $1`

	rVTPP, errVTPP := db.VmsDb.Query(ctx, qVmsTblPersonaliaP, strconv.Itoa(int(profilePenyedia.IdProfilPenyedia.Int32)))
	if errVTPP != nil {
		log.Fatal("qVmsTblPersonaliaP Failed, " + errVTPP.Error() + " " + qVmsTblPersonaliaP)
	}

	allVTPP, errCollect := pgx.CollectRows(rVTPP, pgx.RowToStructByName[VmsTblPersonaliaPerush])
	if errCollect != nil {
		log.Fatal("failed collecting rows, " + errCollect.Error())
	}
	defer rVTPP.Close()

	for _, vTPP := range allVTPP {
		qIns := `
		INSERT INTO ref_tenaga_ahli_bu (
		  kode_vendor,
		  nama,
		  no_ktp,
		  file_ktp,
		  tempat_lahir,
		  tgl_lahir,
		  posisi,
		  kode_jenjang_pendidikan,
		  program_studi,
		  file_ijazah,
		  file_cv
		) VALUES (
		  @kode_vendor,
		  @nama,
		  @no_ktp,
		  @file_ktp,
		  @tempat_lahir,
		  @tgl_lahir,
		  @posisi,
		  @kode_jenjang_pendidikan,
		  @program_studi,
		  @file_ijazah,
		  @file_cv
		)`

		args := pgx.NamedArgs{
			"kode_vendor":             profilePenyedia.IdProfilPenyedia,
			"nama":                    vTPP.NmPersonal,
			"no_ktp":                  sql.NullString{},
			"file_ktp":                sql.NullString{},
			"tempat_lahir":            sql.NullString{},
			"tgl_lahir":               sql.NullString{},
			"posisi":                  vTPP.JbtnPersonal,
			"kode_jenjang_pendidikan": sql.NullInt16{}, // TODO: membuat konversi dari data lama
			"program_studi":           sql.NullString{},
			"file_ijazah":             vTPP.PathPersonal,
			"file_cv":                 sql.NullString{},
		}

		_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
		if errIns != nil {
			fmt.Println("unable to insert ref_tenaga_ahli_bu, " + errIns.Error())
		}
	}

}
