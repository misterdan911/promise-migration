package tblsertifperoranganmodel

import (
	"database/sql"
	"promise-migration/db"
)

type TblSertifPeroranganDocument struct {
    IdProfilPenyedia   sql.NullInt32
    PathSertif         sql.NullString
}

func GetAllDocument() ([]TblSertifPeroranganDocument, error) {

  qData := `
  SELECT id_profil_penyedia, path_pnglmn
  FROM tbl_pengalaman_perorangan`

  results, err := db.MyVmsDb.Query(qData)
  if err != nil {
    return nil, err
  }
  defer results.Close()

  var documents []TblSertifPeroranganDocument

  for results.Next() {
      var doc TblSertifPeroranganDocument
      err := results.Scan(
          &doc.IdProfilPenyedia,
          &doc.PathSertif,
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