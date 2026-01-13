package trxjenissispembayaranmodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type TrxJenisSispembayaran struct {
	KodeTrxJenisSispembayaran pgtype.Int4
	KodeSistemPembayaran      pgtype.Int4
	NamaSispembayaran         pgtype.Text
	Persentase                pgtype.Float8
	NilaiRupiah               pgtype.Float8
	StatusSispembayaran       pgtype.Int2
}

func InsertNew(trxJenisSispembayaran TrxJenisSispembayaran) TrxJenisSispembayaran {
	ctx := context.Background()

	qInsert := `
	INSERT INTO trx_jenis_sispembayaran (
		kode_sistem_pembayaran,
		nama_sispembayaran,
		persentase,
		nilai_rupiah,
		status_sispembayaran
	) VALUES (
		@kode_sistem_pembayaran,
		@nama_sispembayaran,
		@persentase,
		@nilai_rupiah,
		@status_sispembayaran
	) RETURNING *`

	args := pgx.NamedArgs{
		"kode_sistem_pembayaran": trxJenisSispembayaran.KodeSistemPembayaran,
		"nama_sispembayaran":     trxJenisSispembayaran.NamaSispembayaran,
		"persentase":             trxJenisSispembayaran.Persentase,
		"nilai_rupiah":           trxJenisSispembayaran.NilaiRupiah,
		"status_sispembayaran":   trxJenisSispembayaran.StatusSispembayaran,
	}

	rwIns, errIns := db.DbSibela.Query(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert trx_jenis_sispembayaran, " + errIns.Error())
	}
	defer rwIns.Close()

	allTrxJenisSispembayaran, err := pgx.CollectRows(rwIns, pgx.RowToStructByName[TrxJenisSispembayaran])
	if err != nil {
		log.Fatal("failed collecting TrxJenisSispembayaran, " + err.Error())
	}

	return allTrxJenisSispembayaran[0]
}
