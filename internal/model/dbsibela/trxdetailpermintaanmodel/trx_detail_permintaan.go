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

func InsertNewData(trxDetailPermintaan TrxDetailPermintaan) TrxDetailPermintaan {
	ctx := context.Background()

	qIns := `
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
	) RETURNING *`

	args := pgx.NamedArgs{
		"kode_permintaan": trxDetailPermintaan.KodePermintaan,
		"kode_bmut":       trxDetailPermintaan.KodeBmut,
		"kode_ruang":      trxDetailPermintaan.KodeRuang,
		"merk":            trxDetailPermintaan.Merk,
		"deskripsi":       trxDetailPermintaan.Deskripsi,
		"kuantitas":       trxDetailPermintaan.Kuantitas,
		"satuan":          trxDetailPermintaan.Satuan,
		"harga":           trxDetailPermintaan.Harga,
	}

	/*
		rwTrxDetailPermintaan, errIns := db.DbSibela.Query(ctx, qInsert, args)
		if errIns != nil {
			fmt.Println("satuan: " + trxDetailPermintaan.Satuan.String + ghelper.GetLen(trxDetailPermintaan.Satuan.String))
			log.Fatal("unable to insert trx_detail_permintaan (trx_detail_permintaan.go:InsertNewData), " + errIns.Error())
			// return nil, errIns
		}

		return trxDetailPermintaan2
	*/

	rwIns, errIns := db.DbSibela.Query(ctx, qIns, args)
	if errIns != nil {
		fmt.Println("satuan: " + trxDetailPermintaan.Satuan.String + ghelper.GetLen(trxDetailPermintaan.Satuan.String))
		log.Fatal("unable to insert trx_detail_permintaan (trx_detail_permintaan.go:InsertNewData), " + errIns.Error())
	}

	defer rwIns.Close()

	allRows, errRwIns := pgx.CollectRows(rwIns, pgx.RowToStructByName[TrxDetailPermintaan])

	if errRwIns != nil {
		fmt.Println("satuan: " + trxDetailPermintaan.Satuan.String + ghelper.GetLen(trxDetailPermintaan.Satuan.String))
		log.Fatal("failed collecting TrxDetailPermintaan (trx_detail_permintaan.go), " + errRwIns.Error())
	}

	return allRows[0]
}
