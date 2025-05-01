package tpaketmodel

import (
	"context"
	"github.com/jackc/pgx/v5"
	"log"
	"promise-migration/db"
	"promise-migration/internal/sidapet/structs"
)

func GetAllPaket() []structs.VmsTblPaket {
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

	allRows, err := pgx.CollectRows(rSelect, pgx.RowToStructByName[structs.VmsTblPaket])
	if err != nil {
		log.Fatal("failed collecting tbl_select, " + err.Error())
	}
	defer rSelect.Close()

	return allRows
}
