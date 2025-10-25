package logsibelamodel

import (
	"context"
	"log"
	"promise-migration/db"
	"promise-migration/internal/model/promise_sibela/tblpaketplonionmodel"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type LogSibela struct {
	IDLogSibela               pgtype.Int4
	IDUser                    pgtype.Int4
	Role                      pgtype.Text
	IDPaket                   pgtype.Int4
	IDPesanan                 pgtype.Int4
	Tahap                     pgtype.Text
	Jenis                     pgtype.Text
	HargaSatuan               pgtype.Int8
	Negosiasi                 pgtype.Int8
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
	case "luar_dpt":
		jenis.String = "luardpt"
	case "dpt":
		jenis.String = "dpt"
	}

	qLogSibela := `
		SELECT 
			id_log_sibela,
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
		FROM public.log_sibela
		WHERE
			jenis = $1
			AND
			(id_pesanan = $2
			OR
			(id_paket = $3 and keterangan_negosiasi is not null))
		ORDER BY id_log_sibela ASC
	`

	rwLogSibela, err := db.PromiseSibela.Query(ctx, qLogSibela, jenis, idPesanan, tblPaketPl.IdPaket)
	if err != nil {
		log.Fatal("qLogSibela Failed, " + err.Error() + " " + qLogSibela)
	}

	allLogSibela, err := pgx.CollectRows(rwLogSibela, pgx.RowToStructByName[LogSibela])
	if err != nil {
		log.Fatal("failed collecting rwLogSibela, " + err.Error())
	}
	defer rwLogSibela.Close()

	return allLogSibela
}
