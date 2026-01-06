package tbltermindptplmodel

import (
	"database/sql"
	"log"
	"promise-migration/db"
)

type TblTermindptPl struct {
	IdTerminDptpl        sql.NullInt32
	PathKwitansidpt      sql.NullString
	PathBastPenyediadpt  sql.NullString
	PathBastPpdpt        sql.NullString
	TerminFile           sql.NullString
	FileScanBast         sql.NullString
	PathKwitansiPpk      sql.NullString
	PathKwitansiPenyedia sql.NullString
	KwitansiFile         sql.NullString
	SppFile              sql.NullString
	FileScanSpp          sql.NullString
}

func GetAllDocument() ([]TblTermindptPl, error) {
	qData := `
    SELECT
        id_termin_dptpl,
        path_kwitansidpt,
        path_bast_penyediadpt,
        path_bast_ppdpt,
        termin_file,
        file_scan_bast,
        path_kwitansi_ppk,
        path_kwitansi_penyedia,
        kwitansi_file,
        spp_file,
        file_scan_spp
    FROM tbl_termindpt_pl`

	results, err := db.MyPromiseSibela.Query(qData)
	if err != nil {
		log.Fatal(err)
	}
	defer results.Close()

	var documents []TblTermindptPl

	for results.Next() {
		var doc TblTermindptPl
		err := results.Scan(
			&doc.IdTerminDptpl,
			&doc.PathKwitansidpt,
			&doc.PathBastPenyediadpt,
			&doc.PathBastPpdpt,
			&doc.TerminFile,
			&doc.FileScanBast,
			&doc.PathKwitansiPpk,
			&doc.PathKwitansiPenyedia,
			&doc.KwitansiFile,
			&doc.SppFile,
			&doc.FileScanSpp,
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
