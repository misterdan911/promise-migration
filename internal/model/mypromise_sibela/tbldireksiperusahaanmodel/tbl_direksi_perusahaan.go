package tbldireksiperusahaanmodel

import (
	"log"
	"database/sql"
	"promise-migration/db"
)

type TblDireksiPerusahaanDocument struct {
    IdDireksiPerus   sql.NullInt32
    IdProfilPenyedia   sql.NullInt32
    PathKtpDireksi         sql.NullString
}

func GetAllDocument() ([]TblDireksiPerusahaanDocument, error) {

  qData := `
  SELECT
    id_direksi_perus,
    id_profil_penyedia,
    path_ktp_direksi
  FROM tbl_direksi_perusahaan
  WHERE
  id_direksi_perus > 0
  order by id_direksi_perus ASC`

  results, err := db.MyPromiseSibela.Query(qData)
  if err != nil {
		log.Fatal(err)
	}
  defer results.Close()

  var documents []TblDireksiPerusahaanDocument

  for results.Next() {
      var doc TblDireksiPerusahaanDocument
      err := results.Scan(
          &doc.IdDireksiPerus,
          &doc.IdProfilPenyedia,
          &doc.PathKtpDireksi,
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
