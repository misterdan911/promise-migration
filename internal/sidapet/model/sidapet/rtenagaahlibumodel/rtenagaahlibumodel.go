package rtenagaahlibumodel

import (
	"context"
	"database/sql"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/sidapet/model/sidapet/rpengalamantamodel"
	"promise-migration/internal/sidapet/model/sidapet/rpengalamantpmodel"
	"promise-migration/internal/sidapet/model/sidapet/rsertiftamodel"
	"promise-migration/internal/sidapet/model/sidapet/rsertiftpmodel"
	"promise-migration/internal/sidapet/sidapethelper"
	"promise-migration/internal/sidapet/structs"
	structs2 "promise-migration/internal/structs"
	"strconv"
	"strings"
)

type RefTenagaAhli struct {
	KodeTenagaAhli pgtype.Int4
}
type RefTenagaPendukung struct {
	KodeTenagaPendukung pgtype.Int4
}

var helperUser helperusermodel.HelperUser

func InsertPersonalia(profilePenyedia structs2.TblProfilePenyedia, userHelper helperusermodel.HelperUser) {

	helperUser = userHelper

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

	allVTPP, errCollect := pgx.CollectRows(rVTPP, pgx.RowToStructByName[structs.VmsTblPersonaliaPerush])
	if errCollect != nil {
		log.Fatal("failed collecting rows, " + errCollect.Error())
	}
	defer rVTPP.Close()

	for _, vTPP := range allVTPP {
		if strings.Contains(strings.ToLower(vTPP.JbtnPersonal.String), "pendukung") {
			InsertRefTenagaPendukungBu(profilePenyedia, vTPP)
		} else {
			InsertRefTenagaAhliBu(profilePenyedia, vTPP)
		}
	}

}

func InsertRefTenagaAhliBu(profilePenyedia structs2.TblProfilePenyedia, vTPP structs.VmsTblPersonaliaPerush) {

	ctx := context.Background()

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
		) RETURNING kode_tenaga_ahli`

	args := pgx.NamedArgs{
		"kode_vendor":             helperUser.KodeVendor,
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

	rwIns, errIns := db.DbSidapet.Query(ctx, qIns, args)
	if errIns != nil {
		log.Fatal("unable to insert ref_tenaga_ahli_bu, " + errIns.Error())
	}

	defer rwIns.Close()

	allRefTenagaAhli, errRwIns := pgx.CollectRows(rwIns, pgx.RowToStructByName[RefTenagaAhli])
	if errRwIns != nil {
		fmt.Println("nama: " + vTPP.NmPersonal.String + sidapethelper.GetLen(vTPP.NmPersonal.String))
		fmt.Println("posisi: " + vTPP.JbtnPersonal.String + sidapethelper.GetLen(vTPP.JbtnPersonal.String))
		fmt.Println("file_ijazah: " + vTPP.PathPersonal.String + sidapethelper.GetLen(vTPP.PathPersonal.String))
		log.Fatal("failed collecting RefTenagaAhli, " + errRwIns.Error())
	}

	kodeTenagaAhli := allRefTenagaAhli[0].KodeTenagaAhli.Int32
	rpengalamantamodel.InsertRefPengalamanTa(kodeTenagaAhli, vTPP)
	rsertiftamodel.InserRefSertifTa(kodeTenagaAhli, vTPP)

}

func InsertRefTenagaPendukungBu(profilePenyedia structs2.TblProfilePenyedia, vTPP structs.VmsTblPersonaliaPerush) {
	ctx := context.Background()

	qIns := `
		INSERT INTO ref_tenaga_pendukung_bu (
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
		) RETURNING kode_tenaga_pendukung`

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

	rwIns, errIns := db.DbSidapet.Query(ctx, qIns, args)
	if errIns != nil {
		fmt.Println("unable to insert ref_tenaga_pendukung_bu, " + errIns.Error())
	}

	defer rwIns.Close()

	allTenagaPendukung, errRwIns := pgx.CollectRows(rwIns, pgx.RowToStructByName[RefTenagaPendukung])
	if errRwIns != nil {
		log.Fatal("failed collecting RefTenagaPendukung, " + errRwIns.Error())
	}

	kodeTenagaPendukung := allTenagaPendukung[0].KodeTenagaPendukung.Int32
	rpengalamantpmodel.InsertRefPengalamanTp(kodeTenagaPendukung, vTPP)
	rsertiftpmodel.InsertRefSertifTp(kodeTenagaPendukung, vTPP)
}
