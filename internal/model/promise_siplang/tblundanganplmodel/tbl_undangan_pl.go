package tblundanganplmodel

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
		id_undangan_pl,
		id_paket_pl,
		nomor_pl,
		banego_file,
		hash_dokumen,
		file_scan_banego,
		tanggal_pl,
		sph_pl,
		tertanggal_pl
	FROM public.tbl_undangan_pl
  WHERE id_paket_pl = $1
	`
	rwData, err := db.PromiseSibela.Query(ctx, qSelect, idPaket)
	if err != nil {
		log.Fatal("qSelect Failed, " + err.Error() + " " + qSelect)
	}

	allData, err2 := pgx.CollectRows(rwData, pgx.RowToStructByName[structs.TblUndanganPl])
	if err2 != nil {
		log.Fatal("failed collecting rwData (tbl_undangan_pl.go), " + err2.Error())
	}
	defer rwData.Close()

	if len(allData) > 0 {
		tblUndanganPl = allData[0]
	}

	return tblUndanganPl
}
