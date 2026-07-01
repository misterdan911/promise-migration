package refmetodepengadaanmodel

import (
	"context"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type RefMetodePengadaan struct {
	KodeMetodePengadaan pgtype.Int4
	MetodePengadaan     pgtype.Text
	KodeKatMetode       pgtype.Int4
	KodeKetPertor       pgtype.Int4
}

func GetByKodeMetodePengadaan(kodeMetodePengadaan pgtype.Int4) RefMetodePengadaan {
	var refMetodePengadaan RefMetodePengadaan
	ctx := context.Background()

	qRefMetodePengadaan := `
	SELECT
		kode_metode_pengadaan,
		metode_pengadaan,
		kode_kat_metode,
		kode_ket_pertor
	FROM ref_metode_pengadaan
	WHERE kode_metode_pengadaan = $1`

	rwRefMetodePengadaan, err := db.DbUsman.Query(ctx, qRefMetodePengadaan, kodeMetodePengadaan)
	if err != nil {
		log.Fatal("qRefMetodePengadaan Failed, " + err.Error() + " " + qRefMetodePengadaan)
	}
	defer rwRefMetodePengadaan.Close()

	allRefMetodePengadaan, err := pgx.CollectRows(rwRefMetodePengadaan, pgx.RowToStructByName[RefMetodePengadaan])
	if err != nil {
		log.Fatal("failed collecting rwRefMetodePengadaan (ref_metode_pengadaan.go:GetByKodeMetodePengadaan), " + err.Error())
	}

	if len(allRefMetodePengadaan) > 0 {
		refMetodePengadaan = allRefMetodePengadaan[0]
	}

	return refMetodePengadaan
}

