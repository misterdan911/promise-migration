package tblsiqutdppmodel

import (
	"database/sql"
	"log"
	"promise-migration/db"
)

type TblSiqutDpp struct {
	IdSiqutDpp   sql.NullInt32
	PathRancanganKontrak sql.NullString
	PathKak sql.NullString
	PathSpek sql.NullString
	PathQuotation sql.NullString
	PathDokBa sql.NullString
	PathDokAddendum sql.NullString
}

func GetAllDocument() ([]TblSiqutDpp, error) {
	qData := `
    SELECT
			id_siqut_dpp,
			path_rancangan_kontrak,
			path_kak,
			path_spek,
			path_quotation,
			path_dok_ba,
			path_dok_addendum
		FROM tbl_siqut_dpp
		WHERE id_siqut_dpp >= 0`

	results, err := db.MyPromiseSiqut.Query(qData)
	if err != nil {
		log.Fatal(err)
	}
	defer results.Close()

	var documents []TblSiqutDpp

	for results.Next() {
		var doc TblSiqutDpp
		err := results.Scan(
			&doc.IdSiqutDpp,
			&doc.PathRancanganKontrak,
			&doc.PathKak,
			&doc.PathSpek,
			&doc.PathQuotation,
			&doc.PathDokBa,
			&doc.PathDokAddendum,
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
