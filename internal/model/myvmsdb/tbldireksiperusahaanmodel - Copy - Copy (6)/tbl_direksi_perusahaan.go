package tblfasilitasperusahaanmodel

import (
	"database/sql"
)

type TblFasilitasPerusahaanDocument struct {
	IdProfilPenyedia sql.NullInt32
	PathFasilitas   sql.NullString
}

func GetAllDocument() ([]TblFasilitasPerusahaanDocument, error) {

  var documents []TblFasilitasPerusahaanDocument

  return documents, nil
}
