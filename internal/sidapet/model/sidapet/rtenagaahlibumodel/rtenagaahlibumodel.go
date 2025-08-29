package rtenagaahlibumodel

import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"promise-migration/db"
	"promise-migration/internal/model/dbsidapet/helperjenjangpendidikankwmodel"
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

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
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
   InsertRefTenagaPendukungBu(vTPP)
  } else {
   InsertRefTenagaAhliBu(vTPP)
  }
 }

}

func InsertRefTenagaAhliBu(vTPP structs.VmsTblPersonaliaPerush) {

 ctx := context.Background()

 var tglLahir pgtype.Text
 strTglLahir, _ := sidapethelper.ConvertToPostgresDate(vTPP.TglPersonal.String)
 if strTglLahir != "" {
  tglLahir = pgtype.Text{Valid: true, String: strTglLahir}
 }

 kodeJenjangPendidikan := GetKodeJenjangPendidikan(vTPP.PendidikanPersonal)

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
  "tgl_lahir":               tglLahir,
  "posisi":                  vTPP.JbtnPersonal,
  "kode_jenjang_pendidikan": kodeJenjangPendidikan,
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
  fmt.Println("tgl_lahir: " + tglLahir.String + sidapethelper.GetLen(tglLahir.String))
  fmt.Println("posisi: " + vTPP.JbtnPersonal.String + sidapethelper.GetLen(vTPP.JbtnPersonal.String))
  fmt.Println("file_ijazah: " + vTPP.PathPersonal.String + sidapethelper.GetLen(vTPP.PathPersonal.String))
  log.Fatal("failed collecting RefTenagaAhli, " + errRwIns.Error())
 }

 kodeTenagaAhli := allRefTenagaAhli[0].KodeTenagaAhli.Int32
 rpengalamantamodel.InsertRefPengalamanTa(kodeTenagaAhli, vTPP)
 rsertiftamodel.InserRefSertifTa(kodeTenagaAhli, vTPP)

}

func InsertRefTenagaPendukungBu(vTPP structs.VmsTblPersonaliaPerush) {
 ctx := context.Background()

 var tglLahir pgtype.Text
 strTglLahir, _ := sidapethelper.ConvertToPostgresDate(vTPP.TglPersonal.String)
 if strTglLahir != "" {
  tglLahir = pgtype.Text{Valid: true, String: strTglLahir}
 }

 kodeJenjangPendidikan := GetKodeJenjangPendidikan(vTPP.PendidikanPersonal)

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
  "kode_vendor":             helperUser.KodeVendor,
  "nama":                    vTPP.NmPersonal,
  "no_ktp":                  sql.NullString{},
  "file_ktp":                sql.NullString{},
  "tempat_lahir":            sql.NullString{},
  "tgl_lahir":               tglLahir,
  "posisi":                  vTPP.JbtnPersonal,
  "kode_jenjang_pendidikan": kodeJenjangPendidikan,
  "program_studi":           sql.NullString{},
  "file_ijazah":             vTPP.PathPersonal,
  "file_cv":                 sql.NullString{},
 }

 rwIns, err1 := db.DbSidapet.Query(ctx, qIns, args)
 if err1 != nil {
  fmt.Println("unable to insert ref_tenaga_pendukung_bu, " + err1.Error())
 }

 defer rwIns.Close()

 allTenagaPendukung, err2 := pgx.CollectRows(rwIns, pgx.RowToStructByName[RefTenagaPendukung])
 if err2 != nil {
  log.Fatal("failed collecting RefTenagaPendukung, " + err2.Error())
 }

 kodeTenagaPendukung := allTenagaPendukung[0].KodeTenagaPendukung.Int32
 rpengalamantpmodel.InsertRefPengalamanTp(kodeTenagaPendukung, vTPP)
 rsertiftpmodel.InsertRefSertifTp(kodeTenagaPendukung, vTPP)
}


func GetKodeJenjangPendidikan(pendidikanPersonal pgtype.Text) pgtype.Int4 {
  var kodeJenjangPendidikan pgtype.Int4

  allHelperJenjangPendidikanKw := helperjenjangpendidikankwmodel.GetAllData()

  for _, helperJenjangPendidikanKw := range allHelperJenjangPendidikanKw {
    // fmt.Printf(helperJenjangPendidikanKw.Keyword.String + "\n")
    contains := strings.Contains(strings.ToLower(pendidikanPersonal.String), strings.ToLower(helperJenjangPendidikanKw.Keyword.String))
    if contains {
      kodeJenjangPendidikan = helperJenjangPendidikanKw.KodeJenjangPendidikan
      break
    }
  }

  fmt.Printf(pendidikanPersonal.String + " --> %d\n", kodeJenjangPendidikan.Int32)

  return kodeJenjangPendidikan
}