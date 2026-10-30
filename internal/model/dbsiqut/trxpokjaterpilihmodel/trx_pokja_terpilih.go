package trxpokjaterpilihmodel

import (
	"context"
	"log"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"

	"promise-migration/db"
)

type TrxPokjaTerpilih struct {
	KodePokjaTerpilih pgtype.Int4
	KodePerencanaan   pgtype.Int4
	Id                pgtype.Int4
	NamaPokja         pgtype.Text
	Nip               pgtype.Text
	Email             pgtype.Text
}

func InsertNew(trxPokjaTerpilih TrxPokjaTerpilih) TrxPokjaTerpilih {
	ctx := context.Background()

	qIns := `
	INSERT INTO trx_pokja_terpilih(
		kode_perencanaan,
		id,
		nama_pokja,
		nip,
		email
	) VALUES (
		@kode_perencanaan,
		@id,
		@nama_pokja,
		@nip,
		@email
	) RETURNING kode_pokja_terpilih, kode_perencanaan, id, nama_pokja, nip, email`
	
	args := pgx.NamedArgs{
		"kode_perencanaan": trxPokjaTerpilih.KodePerencanaan,
		"id":               trxPokjaTerpilih.Id,
		"nama_pokja":       trxPokjaTerpilih.NamaPokja,
		"nip":              trxPokjaTerpilih.Nip,
		"email":            trxPokjaTerpilih.Email,
	}

	rwIns, errIns := db.DbSiqut.Query(ctx, qIns, args)
	if errIns != nil {
		log.Fatal("unable to insert trx_pokja_terpilih, " + errIns.Error())
	}

	defer rwIns.Close()

	allRows, errRwIns := pgx.CollectRows(rwIns, pgx.RowToStructByName[TrxPokjaTerpilih])

	if errRwIns != nil {
		log.Fatal("failed collecting TrxPokjaTerpilih (trx_pokja_terpilih.go), " + errRwIns.Error())
	}

	return allRows[0]
}
