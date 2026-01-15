package logsiplangmodel

import (
	"context"
	// "fmt"
	"log"
	"promise-migration/db"
	"promise-migration/internal/model/promise_siplang/tblpaketplonionmodel"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type LogSibela struct {
	IDLogSiplang               pgtype.Int4
	IDUser                    pgtype.Int4
	Role                      pgtype.Text
	IDPaket                   pgtype.Int4
	IDPesanan                 pgtype.Int4
	Tahap                     pgtype.Text
	Jenis                     pgtype.Text
	HargaSatuan               pgtype.Text
	Negosiasi                 pgtype.Text
	KeteranganNegosiasi       pgtype.Text
	NegosiasiTeknis           pgtype.Text
	KeteranganNegosiasiTeknis pgtype.Text
	CreatedAt                 pgtype.Timestamptz
	UpdatedAt                 pgtype.Timestamptz
}

func GetDataByIdPesanan(idPesanan pgtype.Int4, tblPaketPl tblpaketplonionmodel.TblPaketPlOnion) []LogSibela {
	ctx := context.Background()

	var jenis pgtype.Text
	jenis.Valid = true
	switch tblPaketPl.JenisPenyedia.String {
	case "luardpt":
		jenis.String = "luardpt"
	case "dpt":
		jenis.String = "dpt"
	}

	jenis.String = "dpt"

	qLogSibela := `
		SELECT 
			id_log_siplang,
			id_user,
			role,
			id_paket,
			id_pesanan,
			tahap,
			jenis,
			harga_satuan,
			negosiasi,
			keterangan_negosiasi,
			negosiasi_teknis,
			keterangan_negosiasi_teknis,
			created_at,
			updated_at
		FROM log_siplang
		WHERE
			jenis = $1
			AND
			(id_pesanan = $2
			OR
			(id_paket = $3 and keterangan_negosiasi is not null))
		ORDER BY id_log_siplang ASC
	`

	/*
	qDebug := `
		SELECT 
			id_log_siplang,
			id_user,
			role,
			id_paket,
			id_pesanan,
			tahap,
			jenis,
			harga_satuan,
			negosiasi,
			keterangan_negosiasi,
			negosiasi_teknis,
			keterangan_negosiasi_teknis,
			created_at,
			updated_at
		FROM log_siplang
		WHERE
			jenis = %v
			AND
			(id_pesanan = %d
			OR
			(id_paket = %d and keterangan_negosiasi is not null))
		ORDER BY id_log_siplang ASC
	`

	fmt.Printf(qDebug, jenis.String, idPesanan.Int32, tblPaketPl.IdPaket.Int32)
	*/





	rwLogSiplang, err := db.PromiseSiplang.Query(ctx, qLogSibela, jenis, idPesanan, tblPaketPl.IdPaket)
	if err != nil {
		log.Fatal("qLogSibela Failed, " + err.Error() + " " + qLogSibela)
	}

	allLogSibela, err := pgx.CollectRows(rwLogSiplang, pgx.RowToStructByName[LogSibela])
	if err != nil {
		log.Fatal("failed collecting rwLogSiplang GetDataByIdPesanan, " + err.Error())
	}
	defer rwLogSiplang.Close()

	return allLogSibela
}

func GetDataNegoTeknis(tblPaket tblpaketplonionmodel.TblPaketPlOnion) []LogSibela {

	ctx := context.Background()

	var jenis pgtype.Text
	jenis.Valid = true
	switch tblPaket.JenisPenyedia.String {
	case "luardpt":
		jenis.String = "luardpt"
	case "dpt":
		jenis.String = "dpt"
	}

	jenis.String = "dpt"

	qLogSibela := `
		SELECT 
			id_log_siplang,
			id_user,
			role,
			id_paket,
			id_pesanan,
			tahap,
			jenis,
			harga_satuan,
			negosiasi,
			keterangan_negosiasi,
			negosiasi_teknis,
			keterangan_negosiasi_teknis,
			created_at,
			updated_at
		FROM public.log_siplang
		WHERE
			jenis = $1
			AND
			id_paket = $2
			AND
			tahap = 'Negosiasi Teknis'
		ORDER BY id_log_siplang ASC
	`

	rwLogSiplang, err := db.PromiseSiplang.Query(ctx, qLogSibela, jenis, tblPaket.IdPaket)
	if err != nil {
		log.Fatal("qLogSibela Failed (log_sibela.go:GetDataNegoTeknis) " + err.Error() + " " + qLogSibela)
	}

	allLogSibela, err := pgx.CollectRows(rwLogSiplang, pgx.RowToStructByName[LogSibela])
	if err != nil {
		log.Fatal("failed collecting rwLogSiplang (log_sibela.go:GetDataNegoTeknis): " + err.Error())
	}
	defer rwLogSiplang.Close()

	return allLogSibela
}
