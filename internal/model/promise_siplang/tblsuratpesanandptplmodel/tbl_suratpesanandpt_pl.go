package tblsuratpesanandptplmodel

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
    id_suratpesanan_dptpl AS id_suratpesanan_pl,
    id_paket_dptpl AS id_paket_pl,
    nomorpesanan_dptsp AS nomorpesanan_sp,
    tanggal_dptsp AS tanggal_sp,
    suratpesanan_status AS suratpesanan_status,
    suratpesanan_barcode AS suratpesanan_barcode,
    suratpesanan_file AS suratpesanan_file,
    hash_dokumen AS hash_dokumen,
    file_scan_sp AS file_scan_sp,
    tempat_dptsp AS tempat_sp,
    sdr_dptsp AS sdr_sp,
    nomor_telepon_dptsdr AS nomor_telepon_sdr,
    alamat_dptsdr AS alamat_sdr,
    tertanggal_dptsp AS tertanggal_sp
	FROM tbl_suratpesanandpt_pl
  WHERE id_paket_dptpl = $1
	`
	rwData, err := db.PromiseSiplang.Query(ctx, qSelect, idPaket)
	if err != nil {
		log.Fatal("qSelect Failed, " + err.Error() + " " + qSelect)
	}

	allData, err2 := pgx.CollectRows(rwData, pgx.RowToStructByName[structs.TblSuratpesananPl])
	if err2 != nil {
		log.Fatal("failed collecting rwData (tbl_suratpesanandpt_pl.go), " + err2.Error())
	}
	defer rwData.Close()

	if len(allData) > 0 {
		tblSuratPesananPl = allData[0]
	}

	return tblSuratPesananPl
}
