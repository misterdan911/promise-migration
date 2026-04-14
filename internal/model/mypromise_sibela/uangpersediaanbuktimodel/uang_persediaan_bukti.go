package uangpersediaanbuktimodel

import (
	"fmt"
	"database/sql"
	"log"
	"promise-migration/db"
)

type UangPersediaanBukti struct {
	IdUangPersediaanBukti sql.NullInt32
	IdUangPersediaan      sql.NullInt32
	Nama                  sql.NullString
	Bukti                 sql.NullString
}

func GetAllDocument() ([]UangPersediaanBukti, error) {
	qData := `
    SELECT
        id_uang_persediaan_bukti,
        id_uang_persediaan,
        nama,
        bukti
    FROM uang_persediaan_bukti
    where id_uang_persediaan_bukti > 22194
    order by id_uang_persediaan_bukti asc`

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