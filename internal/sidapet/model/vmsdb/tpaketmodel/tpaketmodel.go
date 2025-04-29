package tpaketmodel

import (
	"context"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
)

type VmsTblPaket struct {
	IdPaket           pgtype.Int4
	NamaPaket         pgtype.Text
	Metode            pgtype.Text
	IdKategoriBelanja pgtype.Int4
	IdCabang          pgtype.Int4
	TahunAnggaran     pgtype.Int4
	TglDaftarAwal     pgtype.Timestamptz
	TglDaftarAkhir    pgtype.Timestamptz
	TglEvalAwal       pgtype.Timestamptz
	TglEvalAkhir      pgtype.Timestamptz
	TglUmumPaket      pgtype.Timestamptz
	PathPaket         pgtype.Text
	CreatedAt         pgtype.Timestamptz
	UpdatedAt         pgtype.Timestamptz
	Status            pgtype.Int4
}

func GetAllPaket() []VmsTblPaket {
	ctx := context.Background()

	qSelect := `
	SELECT
	  id_paket,
	  nama_paket,
	  metode,
	  id_kategori_belanja,
	  id_cabang,
	  tahun_anggaran,
	  tgl_daftar_awal,
	  tgl_daftar_akhir,
	  tgl_eval_awal,
	  tgl_eval_akhir,
	  tgl_umum_paket,
	  path_paket,
	  created_at,
	  updated_at,
	  status
	FROM tbl_paket ORDER BY id_paket`

	rSelect, err := db.VmsDb.Query(ctx, qSelect)
	if err != nil {
		log.Fatal("qSelect Failed, " + err.Error() + " " + qSelect)
	}

	allRows, err := pgx.CollectRows(rSelect, pgx.RowToStructByName[VmsTblPaket])
	if err != nil {
		log.Fatal("failed collecting tbl_select, " + err.Error())
	}
	defer rSelect.Close()

	return allRows
}
