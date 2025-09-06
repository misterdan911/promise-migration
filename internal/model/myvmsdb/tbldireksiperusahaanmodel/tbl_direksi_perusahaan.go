package tbldireksiperusahaanmodel

import (
		"database/sql"
		"promise-migration/db"
)

type TblDireksiPerusahaanDocument struct {
    IdProfilPenyedia   sql.NullInt32
    PathKtpDireksi         sql.NullString
}

func GetAllDocument() ([]TblDireksiPerusahaanDocument, error) {

  qData := `
  SELECT
		id_profil_penyedia,
		path_ktp_direksi
  FROM tbl_direksi_perusahaan`

  results, err := db.MyVmsDb.Query(qData)
  if err != nil {
    return nil, err
  }
  defer results.Close()

  var documents []TblDireksiPerusahaanDocument

  for results.Next() {
      var doc TblDireksiPerusahaanDocument
      err := results.Scan(
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
