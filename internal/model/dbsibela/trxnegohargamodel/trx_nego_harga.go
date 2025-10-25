package trxnegohargamodel

import (
	"context"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type TrxNegoHarga struct {
	KodeNegoHarga        pgtype.Int4
	KodeDetailPermintaan pgtype.Int4
	HargaAwal            pgtype.Int8
	HargaNego            pgtype.Int8
	Negotiator           pgtype.Text
	TglNego              pgtype.Timestamptz
	Tahapan              pgtype.Int4
	Persetujuan          pgtype.Bool
}

func InsertNewData(trxNegoharga TrxNegoHarga) {
	ctx := context.Background()

	qInsert := `
	INSERT INTO trx_nego_harga (
		kode_detail_permintaan,
		harga_awal,
		harga_nego,
		negotiator,
		tahapan,
		persetujuan
	) VALUES (
		@kode_detail_permintaan,
		@harga_awal,
		@harga_nego,
		@negotiator,
		@tahapan,
		@persetujuan
	)`

	args := pgx.NamedArgs{
		"kode_detail_permintaan": trxNegoharga.KodeDetailPermintaan,
		"harga_awal":             trxNegoharga.HargaAwal,
		"harga_nego":             trxNegoharga.HargaNego,
		"negotiator":             trxNegoharga.Negotiator,
		"tahapan":                trxNegoharga.Tahapan,
		"persetujuan":            trxNegoharga.Persetujuan,
	}

	_, errIns := db.DbSibela.Exec(ctx, qInsert, args)
	if errIns != nil {
		log.Fatal("unable to insert trx_nego_harga (trx_nego_harga.go:InsertNewData), " + errIns.Error())
	}
}

func UpdatePersetujuan(kodeDetailPermintaan pgtype.Int4) {
	ctx := context.Background()

	qUpdate := `UPDATE trx_nego_harga SET persetujuan = true WHERE kode_detail_permintaan = $1`

	_, errIns := db.DbSibela.Exec(ctx, qUpdate, kodeDetailPermintaan)
	if errIns != nil {
		log.Fatal("unable to update trx_nego_harga.persetujuan (trx_nego_harga.go:UpdatePersetujuan), " + errIns.Error())
	}

}
