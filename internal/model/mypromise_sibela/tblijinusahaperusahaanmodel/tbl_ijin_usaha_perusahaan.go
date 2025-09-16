package tblijinusahaperusahaanmodel

import (
	"log"
	"database/sql"
	"promise-migration/db"
)

type TblIjinUsahaPerusahaanDocument struct {
	IdProfilPenyedia sql.NullInt32
	PathIzin   sql.NullString
}

func GetAllDocument() ([]TblIjinUsahaPerusahaanDocument, error) {

  qData := `
  SELECT
		id_profil_penyedia,
		path_izin
  FROM tbl_ijin_usaha_perusahaan`

  results, err := db.MyPromiseSibela.Query(qData)
  if err != nil {
		log.Fatal(err)
	}
  defer results.Close()

  var documents []TblIjinUsahaPerusahaanDocument

  for results.Next() {
      var doc TblIjinUsahaPerusahaanDocument
      err := results.Scan(
          &doc.IdProfilPenyedia,
          &doc.PathIzin,
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
