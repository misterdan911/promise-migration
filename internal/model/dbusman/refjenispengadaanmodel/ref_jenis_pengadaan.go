package refjenispengadaanmodel

import (
	"context"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type RefJenisPengadaan struct {
	KodeJenisPengadaan pgtype.Int4
	JenisPengadaan     pgtype.Text
}

func GetByKodeJenisPengadaan(kodeJenisPengadaan pgtype.Int4) RefJenisPengadaan {
	var refJenisPengadaan RefJenisPengadaan
	ctx := context.Background()

	qRefJenisPengadaan := `
	SELECT
		kode_jenis_pengadaan,
		jenis_pengadaan
	FROM ref_jenis_pengadaan
	WHERE kode_jenis_pengadaan = $1`

	rwRefJenisPengadaan, err := db.DbUsman.Query(ctx, qRefJenisPengadaan, kodeJenisPengadaan)
	if err != nil {
		log.Fatal("qRefJenisPengadaan Failed, " + err.Error() + " " + qRefJenisPengadaan)
	}
	defer rwRefJenisPengadaan.Close()

	allRefJenisPengadaan, err := pgx.CollectRows(rwRefJenisPengadaan, pgx.RowToStructByName[RefJenisPengadaan])
	if err != nil {
		log.Fatal("failed collecting rwRefJenisPengadaan (ref_jenis_pengadaan.go:GetByKodeJenisPengadaan), " + err.Error())
	}

	if len(allRefJenisPengadaan) > 0 {
		refJenisPengadaan = allRefJenisPengadaan[0]
	}

	return refJenisPengadaan
}
