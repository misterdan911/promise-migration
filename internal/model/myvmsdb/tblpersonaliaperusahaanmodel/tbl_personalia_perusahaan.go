package tblpersonaliaperusahaanmodel

import (
	"database/sql"
	"promise-migration/db"
)

type TblPersonaliaPerusahaanDocument struct {
	IdProfilPenyedia sql.NullInt32
	PathPersonal   sql.NullString
}

func GetAllDocument() ([]TblPersonaliaPerusahaanDocument, error) {

  qData := `
  SELECT
		id_profil_penyedia,
		path_personal
  FROM tbl_personalia_perusahaan`

  results, err := db.MyVmsDb.Query(qData)
  if err != nil {
    return nil, err
  }
  defer results.Close()

  var documents []TblPersonaliaPerusahaanDocument

  for results.Next() {
      var doc TblPersonaliaPerusahaanDocument
      err := results.Scan(
          &doc.IdProfilPenyedia,
          &doc.PathPersonal,
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