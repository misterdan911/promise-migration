package refperencanaanmodel

import (
	"context"
	"log"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"

	"promise-migration/db"
)

type RefPerencanaan struct {
	KodePerencanaan          pgtype.Int4
	KodeRup                  pgtype.Int4
	KodeKategori             pgtype.Int4
	KodeKetPertor            pgtype.Int4
	NilaiHps                 pgtype.Numeric
	KodeJenisKontrak         pgtype.Int4
	KodeStatusPerencanaan    pgtype.Int4
	KodeDokSTugasPokja       pgtype.Int4
	Ucr                      pgtype.Text
	Uch                      pgtype.Text
	Udcr                     pgtype.Timestamptz
	Udch                     pgtype.Timestamptz
	JenisPengadaan           pgtype.Text
	NamaPaket                pgtype.Text
	NamaKategori             pgtype.Text
	KodeUnit                 pgtype.Text
	NamaUnit                 pgtype.Text
	KodeJenisPengadaan       pgtype.Int4
	KodeKatKontrakPayung     pgtype.Int2
	JenisPengisianKontrakPayung pgtype.Text // Assuming enum type
	IntervalKolom            pgtype.Int4
	JangkaWaktu              pgtype.Int4
	TglKontrakAwal           pgtype.Date
	TglKontrakAkhir          pgtype.Date
	KodeJenisAsset            pgtype.Text
	KodeUraianKelompok       pgtype.Text
	KodePengisianPerItem       pgtype.Int4
}

func InsertNew(refPerencanaan RefPerencanaan) RefPerencanaan {
	ctx := context.Background()

	qIns := `
	INSERT INTO ref_perencanaan(
		kode_perencanaan,
		kode_rup,
		kode_kategori,
		kode_ket_pertor,
		nilai_hps,
		kode_jenis_kontrak,
		kode_status_perencanaan,
		kode_dok_s_tugas_pokja,
		ucr,
		uch,
		udcr,
		udch,
		jenis_pengadaan,
		nama_paket,
		nama_kategori,
		kode_unit,
		nama_unit,
		kode_jenis_pengadaan,
		kode_kat_kontrak_payung,
		jenis_pengisian_kontrak_payung,
		interval_kolom,
		jangka_waktu,
		tgl_kontrak_awal,
		tgl_kontrak_akhir,
		kode_jenis_asset,
		kode_uraian_kelompok
	) VALUES (
		@kode_perencanaan,
		@kode_rup,
		@kode_kategori,
		@kode_ket_pertor,
		@nilai_hps,
		@kode_jenis_kontrak,
		@kode_status_perencanaan,
		@kode_dok_s_tugas_pokja,
		@ucr,
		@uch,
		@udcr,
		@udch,
		@jenis_pengadaan,
		@nama_paket,
		@nama_kategori,
		@kode_unit,
		@nama_unit,
		@kode_jenis_pengadaan,
		@kode_kat_kontrak_payung,
		@jenis_pengisian_kontrak_payung,
		@interval_kolom,
		@jangka_waktu,
		@tgl_kontrak_awal,
		@tgl_kontrak_akhir,
		@kode_jenis_asset,
		@kode_uraian_kelompok
	) RETURNING *`
	
	args := pgx.NamedArgs{
		"kode_perencanaan":          refPerencanaan.KodePerencanaan,
		"kode_rup":                  refPerencanaan.KodeRup,
		"kode_kategori":             refPerencanaan.KodeKategori,
		"kode_ket_pertor":           refPerencanaan.KodeKetPertor,
		"nilai_hps":                 refPerencanaan.NilaiHps,
		"kode_jenis_kontrak":        refPerencanaan.KodeJenisKontrak,
		"kode_status_perencanaan":   refPerencanaan.KodeStatusPerencanaan,
		"kode_dok_s_tugas_pokja":    refPerencanaan.KodeDokSTugasPokja,
		"ucr":                       refPerencanaan.Ucr,
		"uch":                       refPerencanaan.Uch,
		"udcr":                      refPerencanaan.Udcr,
		"udch":                      refPerencanaan.Udch,
		"jenis_pengadaan":           refPerencanaan.JenisPengadaan,
		"nama_paket":                refPerencanaan.NamaPaket,
		"nama_kategori":             refPerencanaan.NamaKategori,
		"kode_unit":                 refPerencanaan.KodeUnit,
		"nama_unit":                 refPerencanaan.NamaUnit,
		"kode_jenis_pengadaan":      refPerencanaan.KodeJenisPengadaan,
		"kode_kat_kontrak_payung":   refPerencanaan.KodeKatKontrakPayung,
		"jenis_pengisian_kontrak_payung": refPerencanaan.JenisPengisianKontrakPayung,
		"interval_kolom":            refPerencanaan.IntervalKolom,
		"jangka_waktu":            refPerencanaan.JangkaWaktu,
		"tgl_kontrak_awal":            refPerencanaan.TglKontrakAwal,
		"tgl_kontrak_akhir":            refPerencanaan.TglKontrakAkhir,
		"kode_jenis_asset":            refPerencanaan.KodeJenisAsset,
		"kode_uraian_kelompok":            refPerencanaan.KodeUraianKelompok,
	}

	rwIns, errIns := db.DbSiqut.Query(ctx, qIns, args)
	if errIns != nil {
		log.Fatal("unable to insert ref_perencanaan, " + errIns.Error())
	}

	defer rwIns.Close()

	allRows, errRwIns := pgx.CollectRows(rwIns, pgx.RowToStructByName[RefPerencanaan])

	if errRwIns != nil {
		log.Fatal("failed collecting RefPerencanaan (ref_perencanaan.go), " + errRwIns.Error())
	}

	return allRows[0]
}


func UpdateSequence() {
	ctx := context.Background()
	qUpdate := "SELECT setval('ref_perencanaan_kode_perencanaan_seq', (SELECT MAX(kode_perencanaan) FROM ref_perencanaan))"
	_, err := db.DbSiqut.Exec(ctx, qUpdate)
	if err != nil {
		log.Fatal("Update Sequence Failed (siqut ref_perencanaan.go), " + err.Error())
	}
}
