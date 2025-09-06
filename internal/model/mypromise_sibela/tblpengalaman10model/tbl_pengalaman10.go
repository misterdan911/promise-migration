package tblpengalaman10model

import (
	"database/sql"
	"promise-migration/db"
)

type TblPengalaman10Document struct {
	IdProfilPenyedia sql.NullInt32
	PathPnglmn10   sql.NullString
}

func GetAllDocument() ([]TblPengalaman10Document, error) {

  qData := `
  SELECT
		id_profil_penyedia,
		path_pnglmn_10
  FROM tbl_pengalaman_10`

  results, err := db.MyVmsDb.Query(qData)
  if err != nil {
    return nil, err
  }
  defer results.Close()

  var documents []TblPengalaman10Document

  for results.Next() {
      var doc TblPengalaman10Document
      err := results.Scan(
          &doc.IdProfilPenyedia,
          &doc.PathPnglmn10,
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