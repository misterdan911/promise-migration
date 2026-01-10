package tblterminplmodel

import (
	"database/sql"
	"log"
	"promise-migration/db"
)

type TblTerminPl struct {
	IdTerminPl           sql.NullInt32
	PathKwitansi         sql.NullString
	PathBastPenyedia     sql.NullString
	PathBastPp           sql.NullString
	TerminFile           sql.NullString
	FileScanBast         sql.NullString
	KwitansiFile         sql.NullString
	SppFile              sql.NullString
	FileScanSpp          sql.NullString
	PathKwitansiPpk      sql.NullString
	PathKwitansiPenyedia sql.NullString
}

func GetAllDocument() ([]TblTerminPl, error) {
	qData := `
    SELECT
        id_termin_pl,
        path_kwitansi,
        path_bast_penyedia,
        path_bast_pp,
        termin_file,
        file_scan_bast,
        kwitansi_file,
        spp_file,
        file_scan_spp,
        path_kwitansi_ppk,
        path_kwitansi_penyedia
    FROM tbl_termin_pl
    where id_termin_pl > 6799
    order by id_termin_pl asc`

	results, err := db.MyPromiseSibela.Query(qData)
	if err != nil {
		log.Fatal(err)
	}
	defer results.Close()

	var documents []TblTerminPl

	for results.Next() {
		var doc TblTerminPl
		err := results.Scan(
			&doc.IdTerminPl,
			&doc.PathKwitansi,
			&doc.PathBastPenyedia,
			&doc.PathBastPp,
			&doc.TerminFile,
			&doc.FileScanBast,
			&doc.KwitansiFile,
			&doc.SppFile,
			&doc.FileScanSpp,
			&doc.PathKwitansiPpk,
			&doc.PathKwitansiPenyedia,
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
