package tverifikatorpenjrmodel

import (
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
	"promise-migration/internal/sidapet/structs"
)

type TblVerifPaket struct {
	IdVerifPaket pgtype.Int4
	Email        pgtype.Text
}

func InsertTrxVerifikatorPenjr(vmsPaket structs.VmsTblPaket) {
	ctx := context.Background()

	qTblVerifpaket := `
    SELECT
	  id_verif_paket,
	  users.email AS email
    FROM tbl_verif_paket
    INNER JOIN users ON users.id = tbl_verif_paket.id_pegawai
    WHERE id_paket = $1
    ORDER BY id_verif_paket ASC`

	rwTblVerifPaket, err := db.VmsDb.Query(ctx, qTblVerifpaket, vmsPaket.IdPaket)
	if err != nil {
		log.Fatal("qTblVerifpaket Failed, " + err.Error() + " " + qTblVerifpaket)
	}

	allTblVerifPaket, err := pgx.CollectRows(rwTblVerifPaket, pgx.RowToStructByName[TblVerifPaket])
	if err != nil {
		log.Fatal("failed collecting rwTblVerifPaket, " + err.Error())
	}
	defer rwTblVerifPaket.Close()

	for _, tblVerifPaket := range allTblVerifPaket {
		qInsertTrxVerPjr := `
		INSERT INTO trx_verifikator_penjr (kode_verifikator_penjr, kode_penjaringan, user_verif)
		VALUES ( @kode_verifikator_penjr, @kode_penjaringan, @user_verif )`

		args := pgx.NamedArgs{
			"kode_verifikator_penjr": tblVerifPaket.IdVerifPaket,
			"kode_penjaringan":       vmsPaket.IdPaket,
			"user_verif":             tblVerifPaket.Email,
		}
		_, errInsertTrxVerPjr := db.DbSidapet.Exec(ctx, qInsertTrxVerPjr, args)
		if errInsertTrxVerPjr != nil {
			fmt.Println("unable to insert trx_verifikator_penjr, " + errInsertTrxVerPjr.Error())
		}
	}
}
