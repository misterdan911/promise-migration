package refpermintaanmodel

import (
	"context"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type RefPermintaan struct {
	KodePermintaan             pgtype.Int4
	KodeUnit                   pgtype.Text
	JenisPenyedia              pgtype.Text // Note: This is an enum type "public.jenis_penyedia"
	KodeVendor                 pgtype.Int4
	NamaPaket                  pgtype.Text
	KodeSkemaPembayaran        pgtype.Int4
	KodeJenisPengadaan         pgtype.Int4
	KodeJenisAset              pgtype.Text
	KodeUraianKlmpk            pgtype.Text
	FileKerangkaAk             pgtype.Text
	NilaiHps                   pgtype.Int4
	FileRincianHps             pgtype.Text
	FileDokPendukung           pgtype.Text
	FileDokPendukungPenyedia   pgtype.Text
	KodeJenisKontrak           pgtype.Int4
	TglKirimKePenyedia         pgtype.Timestamptz
	TglSelesaiKontrak          pgtype.Timestamptz
	TglBeritaAcara             pgtype.Timestamptz
	IsiBeritaAcara             pgtype.Text
	KodeStatusPermintaan       pgtype.Int4
	Ucr                        pgtype.Text
	Uch                        pgtype.Text
	Udcr                       pgtype.Timestamptz
	Udch                       pgtype.Timestamptz
	RuangLingkup               pgtype.Text
	NamaUnit                   pgtype.Text
	DeskripsiPendukungPenyedia pgtype.Text
	KodeRup                    pgtype.Int4
	TglSelesaiNegosiasi        pgtype.Timestamptz
}

func InsertNew(refPermintaan RefPermintaan) {
	ctx := context.Background()

	qIns := `
	INSERT INTO ref_permintaan(
		kode_permintaan,
		kode_unit,
		jenis_penyedia,
		kode_vendor,
		nama_paket,
		kode_skema_pembayaran,
		kode_jenis_pengadaan,
		kode_jenis_aset,
		kode_uraian_klmpk,
		file_kerangka_ak,
		nilai_hps,
		file_rincian_hps,
		file_dok_pendukung,
		file_dok_pendukung_penyedia,
		kode_jenis_kontrak,
		tgl_kirim_ke_penyedia,
		tgl_selesai_kontrak,
		tgl_berita_acara,
		isi_berita_acara,
		kode_status_permintaan,
		ucr,
		uch,
		udcr,
		udch,
		ruang_lingkup,
		nama_unit,
		deskripsi_pendukung_penyedia,
		kode_rup,
		tgl_selesai_negosiasi
  ) VALUES (
    @kode_permintaan,
		@kode_unit,
		@jenis_penyedia,
		@kode_vendor,
		@nama_paket,
		@kode_skema_pembayaran,
		@kode_jenis_pengadaan,
		@kode_jenis_aset,
		@kode_uraian_klmpk,
		@file_kerangka_ak,
		@nilai_hps,
		@file_rincian_hps,
		@file_dok_pendukung,
		@file_dok_pendukung_penyedia,
		@kode_jenis_kontrak,
		@tgl_kirim_ke_penyedia,
		@tgl_selesai_kontrak,
		@tgl_berita_acara,
		@isi_berita_acara,
		@kode_status_permintaan,
		@ucr,
		@uch,
		@udcr,
		@udch,
		@ruang_lingkup,
		@nama_unit,
		@deskripsi_pendukung_penyedia,
		@kode_rup,
		@tgl_selesai_negosiasi
  )`

	args := pgx.NamedArgs{
		"kode_permintaan":              refPermintaan.KodePermintaan,
		"kode_unit":                    refPermintaan.KodeUnit,
		"jenis_penyedia":               refPermintaan.JenisPenyedia,
		"kode_vendor":                  refPermintaan.KodeVendor,
		"nama_paket":                   refPermintaan.NamaPaket,
		"kode_skema_pembayaran":        refPermintaan.KodeSkemaPembayaran,
		"kode_jenis_pengadaan":         refPermintaan.KodeJenisPengadaan,
		"kode_jenis_aset":              refPermintaan.KodeJenisAset,
		"kode_uraian_klmpk":            refPermintaan.KodeUraianKlmpk,
		"file_kerangka_ak":             refPermintaan.FileKerangkaAk,
		"nilai_hps":                    refPermintaan.NilaiHps,
		"file_rincian_hps":             refPermintaan.FileRincianHps,
		"file_dok_pendukung":           refPermintaan.FileDokPendukung,
		"file_dok_pendukung_penyedia":  refPermintaan.FileDokPendukungPenyedia,
		"kode_jenis_kontrak":           refPermintaan.KodeJenisKontrak,
		"tgl_kirim_ke_penyedia":        refPermintaan.TglKirimKePenyedia,
		"tgl_selesai_kontrak":          refPermintaan.TglSelesaiKontrak,
		"tgl_berita_acara":             refPermintaan.TglBeritaAcara,
		"isi_berita_acara":             refPermintaan.IsiBeritaAcara,
		"kode_status_permintaan":       refPermintaan.KodeStatusPermintaan,
		"ucr":                          refPermintaan.Ucr,
		"uch":                          refPermintaan.Uch,
		"udcr":                         refPermintaan.Udcr,
		"udch":                         refPermintaan.Udch,
		"ruang_lingkup":                refPermintaan.RuangLingkup,
		"nama_unit":                    refPermintaan.NamaUnit,
		"deskripsi_pendukung_penyedia": refPermintaan.DeskripsiPendukungPenyedia,
		"kode_rup":                     refPermintaan.KodeRup,
		"tgl_selesai_negosiasi":        refPermintaan.TglSelesaiNegosiasi,
	}

	_, errIns := db.DbSibela.Exec(ctx, qIns, args)
	if errIns != nil {
		log.Fatal("unable to insert ref_permintaan, " + errIns.Error())
	}
}
