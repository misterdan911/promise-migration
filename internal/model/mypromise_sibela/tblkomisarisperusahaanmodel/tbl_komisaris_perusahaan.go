package tblkomisarisperusahaanmodel

import (
	"log"
	"database/sql"
	"promise-migration/db"
)

type TblKomisarisPerusahaanDocument struct {
	IdProfilPenyedia sql.NullInt32
	PathKtpKomisaris   sql.NullString
}

func GetAllDocument() ([]TblKomisarisPerusahaanDocument, error) {

  qData := `
  SELECT
		id_profil_penyedia,
		path_ktp_komisaris
  FROM tbl_komisaris_perusahaan`

  results, err := db.MyPromiseSibela.Query(qData)
  if err != nil {
		log.Fatal(err)
	}
  defer results.Close()

  var documents []TblKomisarisPerusahaanDocument

  for results.Next() {
      var doc TblKomisarisPerusahaanDocument
      err := results.Scan(
          &doc.IdProfilPenyedia,
          &doc.PathKtpKomisaris,
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
