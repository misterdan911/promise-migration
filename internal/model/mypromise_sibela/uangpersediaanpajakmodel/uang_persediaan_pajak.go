package uangpersediaanpajakmodel

import (
	"fmt"
	"database/sql"
	"log"
	"promise-migration/db"
)

type UangPersediaanPajak struct {
	IdPajak                      sql.NullInt32
	DokNpwp                      sql.NullString
	DokNonPkp                    sql.NullString
	DokKetentuanKhusus           sql.NullString
	DokKetentuanKhususJenis      sql.NullString
	PathBupot                    sql.NullString
	PathDokumen                  sql.NullString
	PathKursBank                 sql.NullString
	PathKursKmk                  sql.NullString
}

func GetAllDocument() ([]UangPersediaanPajak, error) {
	qData := `
    SELECT
        id_pajak,
        dok_npwp,
        dok_non_pkp,
        dok_ketentuan_khusus,
        dok_ketentuan_khusus_jenis,
        path_bupot,
        path_dokumen,
        path_kurs_bank,
        path_kurs_kmk
    FROM uang_persediaan_pajak
    order by id_pajak asc`

	results, err := db.MyPromiseSibela.Query(qData)
	if err != nil {
		log.Fatal(err)
	}
	defer results.Close()

	var documents []UangPersediaanPajak

	for results.Next() {
		var doc UangPersediaanPajak
		err := results.Scan(
			&doc.IdPajak,
			&doc.DokNpwp,
			&doc.DokNonPkp,
			&doc.DokKetentuanKhusus,
			&doc.DokKetentuanKhususJenis,
			&doc.PathBupot,
			&doc.PathDokumen,
			&doc.PathKursBank,
			&doc.PathKursKmk,
		)
		if err != nil {
			fmt.Println(err)
			return nil, err
		}
		documents = append(documents, doc)
	}

	if err = results.Err(); err != nil {
		return nil, err
	}

	return documents, nil
}