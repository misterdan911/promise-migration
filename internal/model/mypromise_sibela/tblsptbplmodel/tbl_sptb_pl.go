package tblsptbplmodel

import (
		"log"
    "database/sql"
    "promise-migration/db"
)

type TblSptbPl struct {
    IdSptbPl   sql.NullInt32
		DokNonPkp sql.NullString
		DokKetentuanKhusus sql.NullString
		DokKetentuanKhususJenis sql.NullString
		SptbFile sql.NullString
		FileScanSptb sql.NullString
		RingkasankontrakFile sql.NullString
		FileScanRk sql.NullString
		FakturPajakFile sql.NullString
		SspFile sql.NullString
}

func GetAllDocument() ([]TblSptbPl, error) {
    qData := `
    SELECT
			id_sptb_pl,
			dok_non_pkp,
			dok_ketentuan_khusus,
			dok_ketentuan_khusus_jenis,
			sptb_file,
			file_scan_sptb,
			ringkasankontrak_file,
			file_scan_rk,
			faktur_pajak_file,
			ssp_file
    FROM tbl_sptb_pl`

  results, err := db.MyPromiseSibela.Query(qData)
  if err != nil {
		log.Fatal(err)
	}
    defer results.Close()

    var documents []TblSptbPl

    for results.Next() {
        var doc TblSptbPl
        err := results.Scan(
            &doc.IdSptbPl,
						&doc.DokNonPkp,
						&doc.DokKetentuanKhusus,
						&doc.DokKetentuanKhususJenis,
						&doc.SptbFile,
						&doc.FileScanSptb,
						&doc.RingkasankontrakFile,
						&doc.FileScanRk,
						&doc.FakturPajakFile,
						&doc.SspFile,

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
