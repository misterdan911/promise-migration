package tblijinusahaperusahaanmodel

import (
	"database/sql"
	"promise-migration/db"
)

type TblIjinUsahaPerusahaanDocument struct {
	IdIjinUsaha sql.NullInt32
  IdProfilPenyedia sql.NullInt32
	PathIzin   sql.NullString
}

func GetAllDocument() ([]TblIjinUsahaPerusahaanDocument, error) {

  qData := `
  SELECT
		id_ijin_usaha,
    id_profil_penyedia,
		path_izin
  FROM tbl_ijin_usaha_perusahaan
  WHERE id_ijin_usaha >= 0
  ORDER BY id_ijin_usaha ASC`

  results, err := db.MyVmsDb.Query(qData)
  if err != nil {
    return nil, err
  }
  defer results.Close()

  var documents []TblIjinUsahaPerusahaanDocument

  for results.Next() {
      var doc TblIjinUsahaPerusahaanDocument
      err := results.Scan(
          &doc.IdIjinUsaha,
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