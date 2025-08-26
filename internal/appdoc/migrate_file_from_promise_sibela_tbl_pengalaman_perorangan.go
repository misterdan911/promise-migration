package appdoc

import (
	"promise-migration/internal/g"
	"promise-migration/internal/model/mypromise_sibela/tblpengalamaneroranganmodel"

	"github.com/jackc/pgx/v5/pgtype"
)

func MigrateFileFromPromiseSibelaTblPengalamanPerorangan() {

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