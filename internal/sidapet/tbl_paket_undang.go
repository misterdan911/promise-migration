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

	qTblPaketUndang := `SELECT id_undang, id_paket, email FROM tbl_paket_undang ORDER BY id_undang`
	rwPaketUndang, err := db.VmsDb.Query(ctx, qTblPaketUndang)
	if err != nil {
		log.Fatal("qTblPaketUndang Failed, " + err.Error() + " " + qTblPaketUndang)
	}

	allPaketUndang, err := pgx.CollectRows(rwPaketUndang, pgx.RowToStructByName[PaketUndang])
	if err != nil {
		log.Fatal("failed collecting rwPaketUndang, " + err.Error())
	}
	defer rwPaketUndang.Close()

	fmt.Println("Migrating tbl_paket_undang...")

	for _, paketUndang := range allPaketUndang {

		qInsertTrxUndang := `INSERT INTO trx_undangan_penjr ("kode_und_penjr", "kode_penjaringan", "email") VALUES (@kode_und_penjr, @kode_penjaringan, @email)`
		args := pgx.NamedArgs{
			"kode_und_penjr":   paketUndang.IdUndang,
			"kode_penjaringan": paketUndang.IdPaket,
			"email":            paketUndang.Email,
		}
		_, errInsert := db.DbSidapet.Exec(ctx, qInsertTrxUndang, args)
		if errInsert != nil {
			fmt.Println("unable to insert trx_undangan_penjr, " + errInsert.Error())
		}
	}

	fmt.Println("Migrating tbl_paket_undang... SELESAI")
}
