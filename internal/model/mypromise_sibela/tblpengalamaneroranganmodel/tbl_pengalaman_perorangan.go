package tblpengalamaneroranganmodel

import (
	"database/sql"
	"promise-migration/db"
)

type TblPengalamanPeroranganDocument struct {
    IdPengalaman   sql.NullInt32
    IdProfilPenyedia   sql.NullInt32
    PathPnglmn         sql.NullString
}

func GetAllDocument() ([]TblPengalamanPeroranganDocument, error) {

  qData := `
  SELECT
    id_pengalaman,
    id_profil_penyedia,
    path_pnglmn
  FROM tbl_pengalaman_perorangan
  WHERE id_pengalaman >= 0
  ORDER BY id_pengalaman ASC`

  results, err := db.MyPromiseSibela.Query(qData)
  if err != nil {
    return nil, err
  }
  defer results.Close()

  var documents []TblPengalamanPeroranganDocument

  for results.Next() {
      var doc TblPengalamanPeroranganDocument
      err := results.Scan(
          &doc.IdPengalaman,
          &doc.IdProfilPenyedia,
          &doc.PathPnglmn,
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