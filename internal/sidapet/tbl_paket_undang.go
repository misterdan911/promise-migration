package sidapet

import (
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
	"promise-migration/internal/sidapet/helper"
)

type PaketUndang struct {
	IdUndang pgtype.Int4
	IdPaket  pgtype.Int4
	Email    pgtype.Text
}

func MigrateTblPaketUndang() {

	helper.TruncateTable("trx_undangan_penjr")
	ctx := context.Background()

	qTblPaket := `
  SELECT
    tpu.id_undang AS id_undang,
    tp.id_paket,
    email 
  FROM
    tbl_paket tp
    INNER JOIN tbl_paket_undang tpu ON tpu.id_paket = tp.id_paket 
  WHERE
    tp.metode = 'Undangan' 
  ORDER BY
  tp.id_paket`
	rwPaket, err := db.VmsDb.Query(ctx, qTblPaket)
	if err != nil {
		log.Fatal("qTblPaket Failed, " + err.Error() + " " + qTblPaket)
	}

	allPaket, err := pgx.CollectRows(rwPaket, pgx.RowToStructByName[PaketUndang])
	if err != nil {
		log.Fatal("failed collecting rwPaket, " + err.Error())
	}
	defer rwPaket.Close()

	fmt.Println("Migrating tbl_paket_undang...")

	for _, paket := range allPaket {

		qInsertTrxUndang := `INSERT INTO trx_undangan_penjr ("kode_und_penjr", "kode_penjaringan", "email") VALUES (@kode_und_penjr, @kode_penjaringan, @email)`
		args := pgx.NamedArgs{
			"kode_und_penjr":   paket.IdUndang,
			"kode_penjaringan": paket.IdPaket,
			"email":            paket.Email,
		}
		_, errInsert := db.DbSidapet.Exec(ctx, qInsertTrxUndang, args)
		if errInsert != nil {
			fmt.Println("unable to insert trx_undangan_penjr, " + errInsert.Error())
		}
	}

	fmt.Println("Migrating tbl_paket_undang... SELESAI")
}
