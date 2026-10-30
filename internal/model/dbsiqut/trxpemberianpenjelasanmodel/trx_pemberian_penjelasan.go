package trxpemberianpenjelasanmodel

import (
	"context"
	"log"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"

	"promise-migration/db"
)

type TrxPemberianPenjelasan struct {
	KodePenjelasan         pgtype.Int4
	KodePersiapanPemilihan pgtype.Int4
	IsiPenjelasan          pgtype.Text
	TglBaPenjelasan        pgtype.Timestamptz
	KodeDokBaPenjelasan    pgtype.Int4
	IsDppRevisi            pgtype.Bool
	KetPerubahanDpp        pgtype.Text
	IsMdpRevisi            pgtype.Bool
	IsLdpRevisi            pgtype.Bool
	KetPerubahanLdp        pgtype.Text
	IsLdkRevisi            pgtype.Bool
	KetPerubahanLdk        pgtype.Text
	IsJadwalRevisi         pgtype.Bool
	KetPerubahanJadwal     pgtype.Text
	TglBaAddendum          pgtype.Date
	KodeDokBaAddendum      pgtype.Int4
	PenjelasanTambahanPpk  pgtype.Text
	KetPerubahanDppPpk     pgtype.Text
	PpkRevisi              pgtype.Bool
}

func InsertNew(trxPemberianPenjelasan TrxPemberianPenjelasan) TrxPemberianPenjelasan {
	ctx := context.Background()

	qIns := `
	INSERT INTO trx_pemberian_penjelasan(
		kode_persiapan_pemilihan,
		isi_penjelasan,
		tgl_ba_penjelasan,
		kode_dok_ba_penjelasan,
		is_dpp_revisi,
		ket_perubahan_dpp,
		is_mdp_revisi,
		is_ldp_revisi,
		ket_perubahan_ldp,
		is_ldk_revisi,
		ket_perubahan_ldk,
		is_jadwal_revisi,
		ket_perubahan_jadwal,
		tgl_ba_addendum,
		kode_dok_ba_addendum,
		penjelasan_tambahan_ppk,
		ket_perubahan_dpp_ppk,
		ppk_revisi
	) VALUES (
		@kode_persiapan_pemilihan,
		@isi_penjelasan,
		@tgl_ba_penjelasan,
		@kode_dok_ba_penjelasan,
		@is_dpp_revisi,
		@ket_perubahan_dpp,
		@is_mdp_revisi,
		@is_ldp_revisi,
		@ket_perubahan_ldp,
		@is_ldk_revisi,
		@ket_perubahan_ldk,
		@is_jadwal_revisi,
		@ket_perubahan_jadwal,
		@tgl_ba_addendum,
		@kode_dok_ba_addendum,
		@penjelasan_tambahan_ppk,
		@ket_perubahan_dpp_ppk,
		@ppk_revisi
	) RETURNING 
		kode_penjelasan,
		kode_persiapan_pemilihan,
		isi_penjelasan,
		tgl_ba_penjelasan,
		kode_dok_ba_penjelasan,
		is_dpp_revisi,
		ket_perubahan_dpp,
		is_mdp_revisi,
		is_ldp_revisi,
		ket_perubahan_ldp,
		is_ldk_revisi,
		ket_perubahan_ldk,
		is_jadwal_revisi,
		ket_perubahan_jadwal,
		tgl_ba_addendum,
		kode_dok_ba_addendum,
		penjelasan_tambahan_ppk,
		ket_perubahan_dpp_ppk,
		ppk_revisi`

	args := pgx.NamedArgs{
		"kode_persiapan_pemilihan": trxPemberianPenjelasan.KodePersiapanPemilihan,
		"isi_penjelasan":           trxPemberianPenjelasan.IsiPenjelasan,
		"tgl_ba_penjelasan":        trxPemberianPenjelasan.TglBaPenjelasan,
		"kode_dok_ba_penjelasan":   trxPemberianPenjelasan.KodeDokBaPenjelasan,
		"is_dpp_revisi":            trxPemberianPenjelasan.IsDppRevisi,
		"ket_perubahan_dpp":        trxPemberianPenjelasan.KetPerubahanDpp,
		"is_mdp_revisi":            trxPemberianPenjelasan.IsMdpRevisi,
		"is_ldp_revisi":            trxPemberianPenjelasan.IsLdpRevisi,
		"ket_perubahan_ldp":        trxPemberianPenjelasan.KetPerubahanLdp,
		"is_ldk_revisi":            trxPemberianPenjelasan.IsLdkRevisi,
		"ket_perubahan_ldk":        trxPemberianPenjelasan.KetPerubahanLdk,
		"is_jadwal_revisi":         trxPemberianPenjelasan.IsJadwalRevisi,
		"ket_perubahan_jadwal":     trxPemberianPenjelasan.KetPerubahanJadwal,
		"tgl_ba_addendum":          trxPemberianPenjelasan.TglBaAddendum,
		"kode_dok_ba_addendum":     trxPemberianPenjelasan.KodeDokBaAddendum,
		"penjelasan_tambahan_ppk":  trxPemberianPenjelasan.PenjelasanTambahanPpk,
		"ket_perubahan_dpp_ppk":    trxPemberianPenjelasan.KetPerubahanDppPpk,
		"ppk_revisi":               trxPemberianPenjelasan.PpkRevisi,
	}

	rwIns, errIns := db.DbSiqut.Query(ctx, qIns, args)
	if errIns != nil {
		log.Fatal("unable to insert trx_pemberian_penjelasan, " + errIns.Error())
	}

	defer rwIns.Close()

	allRows, errRwIns := pgx.CollectRows(rwIns, pgx.RowToStructByName[TrxPemberianPenjelasan])

	if errRwIns != nil {
		log.Fatal("failed collecting TrxPemberianPenjelasan (trx_pemberian_penjelasan.go), " + errRwIns.Error())
	}

	return allRows[0]
}
