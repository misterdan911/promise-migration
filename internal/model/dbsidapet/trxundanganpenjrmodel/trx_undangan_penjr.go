package trxundanganpenjrmodel

import (
	"context"
	"fmt"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type TrxUndanganPenjr struct {
	KodeUndPenjr    pgtype.Int4
	KodePenjaringan pgtype.Int4
	Nama            pgtype.Text
	Email           pgtype.Text
	Alamat          pgtype.Text
	NamaPic         pgtype.Text
	NoHpWa          pgtype.Text
	TglAwal         pgtype.Timestamptz
	TglAkhir        pgtype.Timestamptz
	Token           pgtype.Text
	KodeVendor      pgtype.Int4
	StatusUndang    pgtype.Text // Assuming status_undang is text-based
}

func InsertNew(trxUndanganPenjr TrxUndanganPenjr) {
	ctx := context.Background()

	qInsert := `
  INSERT INTO trx_undangan_penjr (
      kode_penjaringan,
      nama,
      email,
      alamat,
      nama_pic,
      no_hp_wa,
      tgl_awal,
      tgl_akhir,
      token,
      kode_vendor,
      status_undang
  ) VALUES (
      @kode_penjaringan,
      @nama,
      @email,
      @alamat,
      @nama_pic,
      @no_hp_wa,
      @tgl_awal,
      @tgl_akhir,
      @token,
      @kode_vendor,
      @status_undang
  )`

	args := pgx.NamedArgs{
		"kode_penjaringan": trxUndanganPenjr.KodePenjaringan,
		"nama":             trxUndanganPenjr.Nama,
		"email":            trxUndanganPenjr.Email,
		"alamat":           trxUndanganPenjr.Alamat,
		"nama_pic":         trxUndanganPenjr.NamaPic,
		"no_hp_wa":         trxUndanganPenjr.NoHpWa,
		"tgl_awal":         trxUndanganPenjr.TglAwal,
		"tgl_akhir":        trxUndanganPenjr.TglAkhir,
		"token":            trxUndanganPenjr.Token,
		"kode_vendor":      trxUndanganPenjr.KodeVendor,
		"status_undang":    trxUndanganPenjr.StatusUndang,
	}

	_, errIns := db.DbSidapet.Exec(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert trx_undangan_penjr, " + errIns.Error())
	}

}
