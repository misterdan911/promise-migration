package tblpengalaman3model

import (
	"log"
	"database/sql"
	"promise-migration/db"
)

type TblPengalaman3Document struct {
	IdProfilPenyedia sql.NullInt32
	PathPnglmn3   sql.NullString
}

func GetAllDocument() ([]TblPengalaman3Document, error) {

  qData := `
  SELECT
		id_profil_penyedia,
		path_pnglmn_3
  FROM tbl_pengalaman3`

  results, err := db.MyVmsDb.Query(qData)
  if err != nil {
		log.Fatal(err)
	}
  defer results.Close()

  var documents []TblPengalaman3Document

  for results.Next() {
      var doc TblPengalaman3Document
      err := results.Scan(
          &doc.IdProfilPenyedia,
          &doc.PathPnglmn3,
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
