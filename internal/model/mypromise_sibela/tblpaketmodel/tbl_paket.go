package tblpaketmodel

import (
	"database/sql"
	"promise-migration/db"
)

type TblPaketDocument struct {
	IdProfilPenyedia sql.NullInt32
	PathPaket   sql.NullString
}

func GetAllDocument() ([]TblPaketDocument, error) {

  qData := `
  SELECT
		id_profil_penyedia,
		path_paket
  FROM tbl_paket`

  results, err := db.MyVmsDb.Query(qData)
  if err != nil {
    return nil, err
  }
  defer results.Close()

  var documents []TblPaketDocument

  for results.Next() {
      var doc TblPaketDocument
      err := results.Scan(
          &doc.IdProfilPenyedia,
          &doc.PathPaket,
      )
      if err != nil {
          return nil, err
      }
      documents = append(documents, doc)
  }

  if err = results.Err(); err != nil {
      return nil, err
  }

  return documents, nil
}