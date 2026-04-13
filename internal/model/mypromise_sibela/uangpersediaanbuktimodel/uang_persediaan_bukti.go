package uangpersediaanbuktimodel

import (
	"database/sql"
	"log"
	"promise-migration/db"
)

type UangPersediaanBukti struct {
	IdUangPersediaanBukti sql.NullInt64
	IdUangPersediaan      sql.NullInt64
	Nama                  sql.NullString
	Bukti                 sql.NullString
	CreatedAt             sql.NullTime
	UpdatedAt             sql.NullTime
}

func GetAllDocument() ([]UangPersediaanBukti, error) {
	qData := `
    SELECT
        id_uang_persediaan_bukti,
        id_uang_persediaan,
        nama,
        bukti,
        created_at,
        updated_at
    FROM uang_persediaan_bukti`

	results, err := db.MyPromiseSibela.Query(qData)
	if err != nil {
		log.Fatal(err)
	}
	defer results.Close()

	var documents []UangPersediaanBukti

	for results.Next() {
		var doc UangPersediaanBukti
		err := results.Scan(
			&doc.IdUangPersediaanBukti,
			&doc.IdUangPersediaan,
			&doc.Nama,
			&doc.Bukti,
			&doc.CreatedAt,
			&doc.UpdatedAt,
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