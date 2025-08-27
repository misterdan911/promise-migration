package appdoc

import (
	"promise-migration/internal/g"
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
      g.LogDoc.FieldName = "promise_sibela.tbl_pengalaman_perorangan.path_pnglmn"
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