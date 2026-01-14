package tblundangandptplmodel

import (
	"context"
	"log"
	"promise-migration/db"
	"promise-migration/internal/sibela/structs"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

func GetDataByIdPaket(idPaket pgtype.Int4) structs.TblUndanganPl {

	ctx := context.Background()

	var tblUndanganPl structs.TblUndanganPl

	qSelect := `
	SELECT
		id_undangan_dptpl AS id_undangan_pl,
		id_paket_dptpl AS id_paket_pl,
		nomor_dptpl AS nomor_pl,
		banego_file AS banego_file,
		hash_dokumen AS hash_dokumen,
		file_scan_banego AS file_scan_banego,
		tanggal_dptpl AS tanggal_pl,
		sph_dptpl AS sph_pl,
		tertanggal_dptpl AS tertanggal_pl
	FROM public.tbl_undangandpt_pl
	WHERE id_paket_dptpl = $1
	`
	rwData, err := db.PromiseSiplang.Query(ctx, qSelect, idPaket)
	if err != nil {
		log.Fatal("qSelect Failed, " + err.Error() + " " + qSelect)
	}

	allData, err2 := pgx.CollectRows(rwData, pgx.RowToStructByName[structs.TblUndanganPl])
	if err2 != nil {
		log.Fatal("failed collecting rwData (tbl_undangandpt_pl.go), " + err2.Error())
	}
	defer rwData.Close()

	if len(allData) > 0 {
		tblUndanganPl = allData[0]
	}

	return tblUndanganPl
}
