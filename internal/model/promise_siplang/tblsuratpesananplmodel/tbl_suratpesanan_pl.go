package tblsuratpesananplmodel

import (
	"context"
	"log"
	"promise-migration/db"
	"promise-migration/internal/siplang/structs"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

func GetDataByIdPaket(idPaket pgtype.Int4) structs.TblSuratpesananPl {

	ctx := context.Background()

	var tblSuratPesananPl structs.TblSuratpesananPl

	qSelect := `
	SELECT
    id_suratpesanan_pl,
    id_paket_pl,
    nomorpesanan_sp,
    tanggal_sp,
    suratpesanan_status,
    suratpesanan_file,
    hash_dokumen,
    file_scan_sp,
    tempat_sp,
    sdr_sp,
    nomor_telepon_sdr,
    alamat_sdr,
    tertanggal_sp
	FROM tbl_suratpesanan_pl
  WHERE id_paket_pl = $1
	`
	rwData, err := db.PromiseSiplang.Query(ctx, qSelect, idPaket)
	if err != nil {
		log.Fatal("qSelect Failed, " + err.Error() + " " + qSelect)
	}

	allData, err2 := pgx.CollectRows(rwData, pgx.RowToStructByName[structs.TblSuratpesananPl])
	if err2 != nil {
		log.Fatal("failed collecting rwData (tbl_undangan_pl.go), " + err2.Error())
	}
	defer rwData.Close()

	if len(allData) > 0 {
		tblSuratPesananPl = allData[0]
	}

	return tblSuratPesananPl
}
