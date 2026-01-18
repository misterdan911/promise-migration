package tblfasilitasperusahaanmodel

import (
	"database/sql"
	"promise-migration/db"
)

type TblFasilitasPerusahaanDocument struct {
	IdPeralatan sql.NullInt32
  IdProfilPenyedia sql.NullInt32
	PathFasilitas   sql.NullString
}

func GetAllDocument() ([]TblFasilitasPerusahaanDocument, error) {

  qData := `
  SELECT
		id_peralatan,
    id_profil_penyedia,
		path_fasilitas
  FROM tbl_fasilitas_perusahaan
  WHERE id_peralatan >= 0
  ORDER BY id_peralatan ASC`

  results, err := db.MyVmsDb.Query(qData)
  if err != nil {
    return nil, err
  }
  defer results.Close()

  var documents []TblFasilitasPerusahaanDocument

  for results.Next() {
      var doc TblFasilitasPerusahaanDocument
      err := results.Scan(
          &doc.IdPeralatan,
          &doc.IdProfilPenyedia,
          &doc.PathFasilitas,
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