package trxdetailpermintaanmodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"
	"promise-migration/internal/ghelper"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type TrxDetailPermintaan struct {
	KodeDetailPermintaan pgtype.Int4
	KodePermintaan       pgtype.Int4
	KodeBmut             pgtype.Text
	KodeRuang            pgtype.Text
	Merk                 pgtype.Text
	Deskripsi            pgtype.Text
	Kuantitas            pgtype.Int4
	Satuan               pgtype.Text
	Harga                pgtype.Int4
}

func InsertNewData(trxDetailPermintaan TrxDetailPermintaan) error {
	ctx := context.Background()

	qInsert := `
	INSERT INTO trx_detail_permintaan (
		kode_permintaan,
		kode_bmut,
		kode_ruang,
		merk,
		deskripsi,
		kuantitas,
		satuan,
		harga
	) VALUES (
		@kode_permintaan,
		@kode_bmut,
		@kode_ruang,
		@merk,
		@deskripsi,
		@kuantitas,
		@satuan,
		@harga
	)`

	args := pgx.NamedArgs{
		"kode_permintaan":        trxDetailPermintaan.KodePermintaan,
		"kode_bmut":              trxDetailPermintaan.KodeBmut,
		"kode_ruang":             trxDetailPermintaan.KodeRuang,
		"merk":                   trxDetailPermintaan.Merk,
		"deskripsi":              trxDetailPermintaan.Deskripsi,
		"kuantitas":              trxDetailPermintaan.Kuantitas,
		"satuan":                 trxDetailPermintaan.Satuan,
		"harga":                  trxDetailPermintaan.Harga,
	}

	_, errIns := db.DbSibela.Exec(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("satuan: " + trxDetailPermintaan.Satuan.String + ghelper.GetLen(trxDetailPermintaan.Satuan.String))
		log.Fatal("unable to insert trx_detail_permintaan (trx_detail_permintaan.go:InsertNewData), " + errIns.Error())
		return errIns
	}

	return nil
}
