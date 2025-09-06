package appdoc

import (
	"promise-migration/internal/g"
	"promise-migration/internal/model/myvmsdb/tblaktaperusahaanmodel"
	"promise-migration/internal/model/myvmsdb/tbldireksiperusahaanmodel"
	"promise-migration/internal/model/myvmsdb/tblpengalamaneroranganmodel"
	"promise-migration/internal/model/myvmsdb/tblsertifperoranganmodel"

	"github.com/jackc/pgx/v5/pgtype"
)

func MigrateFileFromVmsDbTblPengalamanPerorangan() {

  allTblPengalamanPerorangan, _ := tblpengalamaneroranganmodel.GetAllDocument()
  originalPath := pgtype.Text{Valid: true, String: ""}

  for _, tblPengalamanPerorangan := range allTblPengalamanPerorangan {

    // promise_sibela.tbl_pengalaman_perorangan.path_pnglmn
    if tblPengalamanPerorangan.PathPnglmn.String != "" {
      g.LogDoc.FieldName = "vms_db.tbl_pengalaman_perorangan.path_pnglmn"
      g.LogDoc.PkId = tblPengalamanPerorangan.IdProfilPenyedia.Int32

      originalPath.String = tblPengalamanPerorangan.PathPnglmn.String
      ProcessOriginalPath(originalPath)
    }
  }
}

func MigrateFileFromVmsDbTblSertifPerorangan() {

  allTblSertifPerorangan, _ := tblsertifperoranganmodel.GetAllDocument()
  originalPath := pgtype.Text{Valid: true, String: ""}

  for _, tblSertifPerorangan := range allTblSertifPerorangan {

    // promise_sibela.tbl_sertif_perorangan.path_sertif
    if tblSertifPerorangan.PathSertif.String != "" {
      g.LogDoc.FieldName = "promise_sibela.tbl_sertif_perorangan.path_sertif"
      g.LogDoc.PkId = tblSertifPerorangan.IdProfilPenyedia.Int32

      originalPath.String = tblSertifPerorangan.PathSertif.String
      ProcessOriginalPath(originalPath)
    }
  }
}

func MigrateFileFromVmsDbTblAktaPerusahaan() {

  allTblAktaPerusahaan, _ := tblaktaperusahaanmodel.GetAllDocument()
  originalPath := pgtype.Text{Valid: true, String: ""}

  for _, tblAktaPerusahaan := range allTblAktaPerusahaan {
		
    // promise_sibela.tbl_akta_perusahaan.path_akta
    if tblAktaPerusahaan.PathAkta.String != "" {
      g.LogDoc.FieldName = "promise_sibela.tbl_akta_perusahaan.path_akta"
      g.LogDoc.PkId = tblAktaPerusahaan.IdProfilPenyedia.Int32

      originalPath.String = tblAktaPerusahaan.PathAkta.String
      ProcessOriginalPath(originalPath)
    }

    if tblAktaPerusahaan.PathAktaAkhir.String != "" {
      g.LogDoc.FieldName = "promise_sibela.tbl_akta_perusahaan.path_akta_akhir"
      g.LogDoc.PkId = tblAktaPerusahaan.IdProfilPenyedia.Int32

      originalPath.String = tblAktaPerusahaan.PathAktaAkhir.String
      ProcessOriginalPath(originalPath)
    }
  }
}

func MigrateFileFromVmsDbTblDireksiPerusahaan() {

  allTblDireksiPerusahaan, _ := tbldireksiperusahaanmodel.GetAllDocument()
  originalPath := pgtype.Text{Valid: true, String: ""}

  for _, tblDireksiPerusahaan := range allTblDireksiPerusahaan {
		
    // promise_sibela.tbl_direksi_perusahaan.path_ktp_direksi
    if tblDireksiPerusahaan.PathKtpDireksi.String != "" {
      g.LogDoc.FieldName = "promise_sibela.tbl_direksi_perusahaan.path_ktp_direksi"
      g.LogDoc.PkId = tblDireksiPerusahaan.IdProfilPenyedia.Int32

      originalPath.String = tblDireksiPerusahaan.PathKtpDireksi.String
      ProcessOriginalPath(originalPath)
    }

  }
}

