package trxnegoteknismodel

import (
	"context"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type TrxNegoTeknis struct {
	KodeNegoTeknis pgtype.Int4
	KodePermintaan pgtype.Int4
	SpekAwal       pgtype.Text
	SpekNego       pgtype.Text
	Negotiator     pgtype.Text
	TglNego        pgtype.Timestamptz
	Tahapan        pgtype.Int4
	Persetujuan    pgtype.Bool
}

func InsertNewData(trxNegoTeknis TrxNegoTeknis) {
	ctx := context.Background()

	qInsert := `
	INSERT INTO trx_nego_teknis (
		kode_permintaan,
		spek_awal,
		spek_nego,
		negotiator,
		tahapan,
		persetujuan
	) VALUES (
		@kode_permintaan,
		@spek_awal,
		@spek_nego,
		@negotiator,
		@tahapan,
		@persetujuan
	)`

	args := pgx.NamedArgs{
		"kode_permintaan": trxNegoTeknis.KodePermintaan,
		"spek_awal":       trxNegoTeknis.SpekAwal,
		"spek_nego":       trxNegoTeknis.SpekNego,
		"negotiator":      trxNegoTeknis.Negotiator,
		"tahapan":         trxNegoTeknis.Tahapan,
		"persetujuan":     trxNegoTeknis.Persetujuan,
	}

	_, errIns := db.DbSibela.Exec(ctx, qInsert, args)
	if errIns != nil {
		log.Fatal("unable to insert trx_nego_teknis (trx_nego_teknis.go:InsertNewData), " + errIns.Error())
	}
}
