package sidapet

import (
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
	"strconv"
)

type RefKeyword struct {
	Keyword            pgtype.Text
	KodeKategori       pgtype.Int4
	KodeJenisPengadaan pgtype.Int4
}

type TrxKategori struct {
	KodeTrxKategori pgtype.Int4
}

func UpdateKodeTrxKategoriOnTrxPenjaringan() {
	ctx := context.Background()
	qKeyword := `SELECT keyword, kode_kategori, kode_jenis_pengadaan FROM helper_kategori_kw ORDER BY id`
	rKeyword, errKw := db.DbSidapet.Query(ctx, qKeyword)
	if errKw != nil {
		log.Fatal("qRuptUt Failed, " + errKw.Error() + " " + qKeyword)
	}

	allKeyword, errCollect := pgx.CollectRows(rKeyword, pgx.RowToStructByName[RefKeyword])

	if errCollect != nil {
		log.Fatal("failed collecting rows, " + errCollect.Error())
	}
	defer rKeyword.Close()

	// Loop all keyword
	for _, kw := range allKeyword {

		// cek apakah di tabel trx_kategori, apakah kode_kategori dari tabel helper sudah ada yg pakai atau belum
		qCheckTrxkat := "SELECT kode_trx_kategori FROM trx_kategori WHERE kode_kategori = $1"
		rCheckTrxkat, errCheckTrxkat := db.DbSidapet.Query(ctx, qCheckTrxkat, strconv.Itoa(int(kw.KodeKategori.Int32)))
		if errCheckTrxkat != nil {
			log.Fatal("qCheckTrxkat Failed, " + errCheckTrxkat.Error() + " " + qCheckTrxkat)
		}

		allTrxKategori, errCollect := pgx.CollectRows(rCheckTrxkat, pgx.RowToStructByName[TrxKategori])
		if errCollect != nil {
			log.Fatal("failed collecting rows, " + errCollect.Error())
		}
		defer rCheckTrxkat.Close()

		var kode_trx_kategori int32

		if len(allTrxKategori) < 1 {
			qInsertTrxKat := `INSERT INTO trx_kategori ("kode_kategori", "kode_jenis_pengadaan", "is_pembuka") VALUES ($1, $2, $3) RETURNING kode_trx_kategori`
			kodeKategori := strconv.Itoa(int(kw.KodeKategori.Int32))
			kodeJenisPengadaan := strconv.Itoa(int(kw.KodeJenisPengadaan.Int32))
			isPembuka := strconv.FormatBool(false)
			rInsertTrxKat, errInsert := db.DbSidapet.Query(ctx, qInsertTrxKat, kodeKategori, kodeJenisPengadaan, isPembuka)
			if errInsert != nil {
				log.Fatal("qInsertTrxKat Failed, " + errInsert.Error() + " " + qInsertTrxKat)
			}
			allTrxKat, errCollect := pgx.CollectRows(rInsertTrxKat, pgx.RowToStructByName[TrxKategori])
			if errCollect != nil {
				log.Fatal("failed collecting rInsertTrxKat, " + errCollect.Error())
			}
			defer rInsertTrxKat.Close()
			kode_trx_kategori = allTrxKat[0].KodeTrxKategori.Int32
		} else {
			kode_trx_kategori = allTrxKategori[0].KodeTrxKategori.Int32
		}

		qUpdate := "UPDATE trx_penjaringan SET kode_trx_kategori = @kodeTrxKategori WHERE nama_penjaringan ILIKE '%' || @keyword || '%'"
		args := pgx.NamedArgs{
			"kodeTrxKategori": kode_trx_kategori,
			"keyword":         kw.Keyword,
		}
		_, errUpdate := db.DbSidapet.Exec(ctx, qUpdate, args)
		if errUpdate != nil {
			fmt.Println("unable to update row, " + errUpdate.Error())
		}
	}
}
