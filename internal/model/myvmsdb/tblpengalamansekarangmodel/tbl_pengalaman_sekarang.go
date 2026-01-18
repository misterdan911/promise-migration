package tblpengalamansekarangmodel

import (
	"database/sql"
	"promise-migration/db"
)

type TblPengalamanSekarangDocument struct {
	IdPengalamanSekarang sql.NullInt32
  IdProfilPenyedia sql.NullInt32
	PathPnglmnSkrg   sql.NullString
}

func GetAllDocument() ([]TblPengalamanSekarangDocument, error) {

  qData := `
  SELECT
		id_pengalaman_sekarang,
    id_profil_penyedia,
		path_pnglmn_skrg
  FROM tbl_pengalaman_sekarang
  WHERE id_pengalaman_sekarang >= 0
  ORDER BY id_pengalaman_sekarang ASC`

  results, err := db.MyVmsDb.Query(qData)
  if err != nil {
    return nil, err
  }
  defer results.Close()

  var documents []TblPengalamanSekarangDocument

  for results.Next() {
      var doc TblPengalamanSekarangDocument
      err := results.Scan(
          &doc.IdPengalamanSekarang,
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