package tblpengalamaneroranganmodel

import (
	"database/sql"
	"promise-migration/db"
)

type TblPengalamanPeroranganDocument struct {
    IdProfilPenyedia   sql.NullInt32
    PathPnglmn         sql.NullString
}

func GetAllDocument() ([]TblPengalamanPeroranganDocument, error) {

	// fmt.Printf("GetAllDocument: tbl_pengalaman_perorangan\n")

  qData := `
  SELECT id_profil_penyedia, path_pnglmn
  FROM tbl_pengalaman_perorangan`

  results, err := db.MyVmsDb.Query(qData)
  if err != nil {
    return nil, err
  }
  defer results.Close()

  var documents []TblPengalamanPeroranganDocument

  for results.Next() {
	
			var doc TblPengalamanPeroranganDocument
      err := results.Scan(
          &doc.IdProfilPenyedia,
          &doc.PathPnglmn,
      )
      if err != nil {
          return nil, err
      }
		  // fmt.Printf("pathPnglmn: %+v\n", doc.PathPnglmn.String)
      documents = append(documents, doc)
  }

  if err = results.Err(); err != nil {
      return nil, err
  }

  return documents, nil
}
