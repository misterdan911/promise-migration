package tblpengalamansekarangmodel

import (
	"log"
	"database/sql"
	"promise-migration/db"
)

type TblPengalamanSekarangDocument struct {
	IdProfilPenyedia sql.NullInt32
	PathPnglmnSkrg   sql.NullString
}

func GetAllDocument() ([]TblPengalamanSekarangDocument, error) {

  qData := `
  SELECT
		id_profil_penyedia,
		path_pnglmn_skrg
  FROM tbl_pengalaman_sekarang`

  results, err := db.MyPromiseSibela.Query(qData)
  if err != nil {
		log.Fatal(err)
	}
  defer results.Close()

  var documents []TblPengalamanSekarangDocument

  for results.Next() {
      var doc TblPengalamanSekarangDocument
      err := results.Scan(
          &doc.IdProfilPenyedia,
          &doc.PathPnglmnSkrg,
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
