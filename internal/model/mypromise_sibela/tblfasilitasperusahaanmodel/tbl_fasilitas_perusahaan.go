package tblfasilitasperusahaanmodel

import (
	"log"
	"database/sql"
	"promise-migration/db"
)

type TblFasilitasPerusahaanDocument struct {
	IdProfilPenyedia sql.NullInt32
	PathFasilitas   sql.NullString
}

func GetAllDocument() ([]TblFasilitasPerusahaanDocument, error) {

  qData := `
  SELECT
		id_profil_penyedia,
		path_fasilitas
  FROM tbl_fasilitas_perusahaan`

  results, err := db.MyPromiseSibela.Query(qData)
  if err != nil {
		log.Fatal(err)
	}
  defer results.Close()

  var documents []TblFasilitasPerusahaanDocument

  for results.Next() {
      var doc TblFasilitasPerusahaanDocument
      err := results.Scan(
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
