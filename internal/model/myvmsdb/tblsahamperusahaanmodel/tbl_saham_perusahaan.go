package tblsahamperusahaanmodel

import (
	"log"
	"database/sql"
	"promise-migration/db"
)

type TblSahamPerusahaanDocument struct {
	IdProfilPenyedia sql.NullInt32
	PathSaham   sql.NullString
}

func GetAllDocument() ([]TblSahamPerusahaanDocument, error) {

  qData := `
  SELECT
		id_profil_penyedia,
		path_saham
  FROM tbl_saham_perusahaan`

  results, err := db.MyVmsDb.Query(qData)
  if err != nil {
		log.Fatal(err)
	}
  defer results.Close()

  var documents []TblSahamPerusahaanDocument

  for results.Next() {
      var doc TblSahamPerusahaanDocument
      err := results.Scan(
          &doc.IdProfilPenyedia,
          &doc.PathSaham,
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
