package tblpesanandptplmodel

import (
	"context"
	"log"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"promise-migration/db"
	"promise-migration/internal/sibela/structs"
)

func GetDataByIdPaket(idPaket pgtype.Int4) []structs.TblPesanan {
	// var tblPesanan structs.TblPesanan
	ctx := context.Background()

	qTblPesanan := `
  SELECT
		id_pesanan_dptpl AS id_pesanan,
		id_paket_dptpl AS id_paket,
		kode_bmn AS kode_bmn,
		kode_ruang AS kode_ruang,
		nama_barang_dptpl AS nama_barang,
		kuantitas_dptpl AS kuantitas,
		satuan_ukuran_dptpl AS satuan_ukuran,
		harga_satuan_dptpl AS harga_satuan,
		negosiasi_dptpl AS negosiasi,
		total_harga_dptpl AS total_harga,
		status_pesanan_dptpl AS status_pesanan
	FROM tbl_pesanandpt_pl
	WHERE id_paket_dptpl = $1
	`
  rwTblPesanan, err := db.PromiseSibela.Query(ctx, qTblPesanan, idPaket)
  if err != nil {
    log.Fatal("qTblPesanan Failed, " + err.Error() + " " + qTblPesanan)
  }

  allTblPesanan, err := pgx.CollectRows(rwTblPesanan, pgx.RowToStructByName[structs.TblPesanan])
  if err != nil {
    log.Fatal("failed collecting rwTblPesanan, " + err.Error())
  }
  defer rwTblPesanan.Close()

	/*
	if len(allTblPesanan) > 0 {
		tblPesanan = allTblPesanan[0]
	}
	*/

	return allTblPesanan
}
