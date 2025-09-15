package tblaktaperusahaanmodel

import (
	"log"
	"database/sql"
	"promise-migration/db"
)

type TblAktaPerusahaanDocument struct {
    IdProfilPenyedia   sql.NullInt32
    PathAkta         sql.NullString
    PathAktaAkhir         sql.NullString
}

func GetAllDocument() ([]TblAktaPerusahaanDocument, error) {

  qData := `
  SELECT
		id_profil_penyedia,
		path_akta,
		path_akta_akhir
  FROM tbl_akta_perusahaan`

  results, err := db.MyPromiseSibela.Query(qData)
  if err != nil {
		log.Fatal(err)
	}
  defer results.Close()

  var documents []TblAktaPerusahaanDocument

  for results.Next() {
      var doc TblAktaPerusahaanDocument
      err := results.Scan(
          &doc.IdProfilPenyedia,
          &doc.PathAkta,
          &doc.PathAktaAkhir,
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
