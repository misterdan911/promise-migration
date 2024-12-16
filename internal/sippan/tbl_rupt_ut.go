package sippan

import (
	"context"
	"database/sql"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
	"promise-migration/internal/sippan/helper"
	"time"
)

type OldRupUt struct {
	IdRupUt                 int
	KodeUnit                string
	KodeUnitLama            pgtype.Text
	IdUser                  pgtype.Int8
	NomorRupUt              pgtype.Text
	NamaPaket               pgtype.Text
	Lokasi                  pgtype.Text
	DetailLokasi            pgtype.Text
	TahunAnggaran           pgtype.Int8
	UraianPekerjaan         pgtype.Text
	SpesifikasiPekerjaan    pgtype.Text
	VolumePekerjaan         pgtype.Text
	Satuan                  pgtype.Text
	ProdukDalamNegeri       pgtype.Text
	Usaha                   pgtype.Text
	JumlahPagu              pgtype.Int8
	PraDipa                 pgtype.Text
	IzinTahunJamak          pgtype.Text
	MetodePengadaan         pgtype.Text
	JenisPengadaan          pgtype.Text
	RencanaPemilihan        pgtype.Text
	RencanaPemilihanAkhir   pgtype.Text
	RencanaPelaksanaan      pgtype.Text
	RencanaPelaksanaanAkhir pgtype.Text
	RencanaPemanfaatan      pgtype.Text
	RencanaPemanfaatanAkhir pgtype.Text
	CreatedAt               time.Time
	UpdatedAt               time.Time
	StatusRup               pgtype.Int8
}

func MigrateTblRupUt() {
	truncateRefRup()

	fmt.Println("Migrating tbl_rup_ut...")

	var err error
	ctx := context.Background()

	qRuptUt := `SELECT id_rup_ut, kode_unit, kode_unit_lama, id_user, nomor_rup_ut, nama_paket, lokasi, detail_lokasi, tahun_anggaran, uraian_pekerjaan, spesifikasi_pekerjaan, volume_pekerjaan, satuan, produk_dalam_negeri, usaha, jumlah_pagu, pra_dipa, izin_tahun_jamak, metode_pengadaan, jenis_pengadaan, rencana_pemilihan, rencana_pemilihan_akhir, rencana_pelaksanaan, rencana_pelaksanaan_akhir, rencana_pemanfaatan, rencana_pemanfaatan_akhir, created_at, updated_at, status_rup FROM tbl_rup_ut ORDER BY id_rup_ut ASC`
	rwRuptUt, err := db.ProSippan.Query(ctx, qRuptUt)
	if err != nil {
		log.Fatal("qRuptUt Failed, " + err.Error() + " " + qRuptUt)
	}

	allOldRuptUt, err := pgx.CollectRows(rwRuptUt, pgx.RowToStructByName[OldRupUt])
	if err != nil {
		log.Fatal("failed collecting rwRuptUt, " + err.Error())
	}
	defer rwRuptUt.Close()

	arrMetodePengadaan := map[string]int{
		"Pembelian Langsung":  1,
		"Pengadaan Langsung":  2,
		"Penunjukan Langsung": 3,
		"Quotation":           4,
		"Tender":              5,
	}

	arrJenisPengadaan := map[string]int{
		"Barang":           1,
		"Konstruksi":       2,
		"Jasa Konsultansi": 3,
		"Jasa Lainnya":     4,
	}

	for _, oldRup := range allOldRuptUt {

		uraian_spek_kerja := helper.GetUraianSpekKerja(oldRup.UraianPekerjaan.String, oldRup.SpesifikasiPekerjaan.String)

		isKualifikasiKecil := sql.NullBool{Valid: true}
		isKualifikasiMenengah := sql.NullBool{Valid: true}
		isKualifikasiBesar := sql.NullBool{Valid: true}

		if oldRup.Usaha.String == "kecil" {
			isKualifikasiKecil.Bool = true
			isKualifikasiMenengah.Bool = false
			isKualifikasiBesar.Bool = false
		} else if oldRup.Usaha.String == "non-kecil" {
			isKualifikasiKecil.Bool = false
			isKualifikasiMenengah.Bool = true
			isKualifikasiBesar.Bool = true
		}

		isPraDrauk := sql.NullBool{Valid: true}
		kategoriDipa := oldRup.PraDipa
		if kategoriDipa.String == "ya" {
			isPraDrauk.Bool = true
		} else if kategoriDipa.String == "tidak" {
			isPraDrauk.Bool = false
		}

		kodeMetodePengadaan := arrMetodePengadaan[oldRup.MetodePengadaan.String]
		kodeJenisPengadaan := arrJenisPengadaan[oldRup.JenisPengadaan.String]
		tglRencPemilihanAwal := helper.ConvertToFirstDayOfMonth(oldRup.RencanaPemilihan.String)
		tglRencPemilihanAkhir := helper.ConvertToLastDayOfMonth(oldRup.RencanaPemilihanAkhir.String)
		tglRencPelaksanaanAwal := helper.ConvertToFirstDayOfMonth(oldRup.RencanaPelaksanaan.String)
		tglRencPelaksanaanAkhir := helper.ConvertToLastDayOfMonth(oldRup.RencanaPelaksanaanAkhir.String)
		tglRencPemanfaatanAwal := helper.ConvertToFirstDayOfMonth(oldRup.RencanaPemilihan.String)
		tglRencPemanfaatanAkhir := helper.ConvertToLastDayOfMonth(oldRup.RencanaPemilihanAkhir.String)

		qInsert := `INSERT INTO ref_rup (kode_rup, no_rup, no_drauk, nama_paket, uraian_spek_kerja, volume_pekerjaan, satuan_volume, kode_kab_kota, lokasi, detail_lokasi, tahun_anggaran, prod_dalam_negri, is_kualifikasi_k, is_kualifikasi_m, is_kualifikasi_b, jml_pagu, is_pra_drauk, kode_jenis_pengadaan, kode_metode_pengadaan, tgl_renc_pemilihan_awal, tgl_renc_pemilihan_akhir, tgl_renc_pelaksanaan_awal, tgl_renc_pelaksanaan_akhir, tgl_renc_pemanfaatan_awal, tgl_renc_pemanfaatan_akhir, status_rup, ucr, uch, udcr, udch)
		VALUES (@kode_rup, @no_rup, @no_drauk, @nama_paket, @uraian_spek_kerja, @volume_pekerjaan, @satuan_volume, @kode_kab_kota, @lokasi, @detail_lokasi, @tahun_anggaran, @prod_dalam_negri, @is_kualifikasi_k, @is_kualifikasi_m, @is_kualifikasi_b, @jml_pagu, @is_pra_drauk, @kode_jenis_pengadaan, @kode_metode_pengadaan, @tgl_renc_pemilihan_awal, @tgl_renc_pemilihan_akhir, @tgl_renc_pelaksanaan_awal, @tgl_renc_pelaksanaan_akhir, @tgl_renc_pemanfaatan_awal, @tgl_renc_pemanfaatan_akhir, @status_rup, @ucr, @uch, @udcr, @udch)`
		args := pgx.NamedArgs{
			"kode_rup":                   oldRup.IdRupUt,
			"no_rup":                     oldRup.NomorRupUt.String,
			"no_drauk":                   sql.NullInt16{Valid: false},
			"nama_paket":                 oldRup.NamaPaket,
			"uraian_spek_kerja":          uraian_spek_kerja,
			"volume_pekerjaan":           oldRup.VolumePekerjaan,
			"satuan_volume":              oldRup.Satuan,
			"kode_kab_kota":              sql.NullString{Valid: false},
			"lokasi":                     oldRup.Lokasi,
			"detail_lokasi":              oldRup.DetailLokasi,
			"tahun_anggaran":             oldRup.TahunAnggaran,
			"prod_dalam_negri":           oldRup.ProdukDalamNegeri,
			"is_kualifikasi_k":           isKualifikasiKecil,
			"is_kualifikasi_m":           isKualifikasiMenengah,
			"is_kualifikasi_b":           isKualifikasiBesar,
			"jml_pagu":                   oldRup.JumlahPagu,
			"is_pra_drauk":               isPraDrauk,
			"kode_jenis_pengadaan":       kodeJenisPengadaan,
			"kode_metode_pengadaan":      kodeMetodePengadaan,
			"tgl_renc_pemilihan_awal":    tglRencPemilihanAwal,
			"tgl_renc_pemilihan_akhir":   tglRencPemilihanAkhir,
			"tgl_renc_pelaksanaan_awal":  tglRencPelaksanaanAwal,
			"tgl_renc_pelaksanaan_akhir": tglRencPelaksanaanAkhir,
			"tgl_renc_pemanfaatan_awal":  tglRencPemanfaatanAwal,
			"tgl_renc_pemanfaatan_akhir": tglRencPemanfaatanAkhir,
			"status_rup":                 sql.NullString{Valid: true, String: "diajukan"},
			"ucr":                        sql.NullTime{Valid: false},
			"uch":                        sql.NullTime{Valid: false},
			"udcr":                       oldRup.CreatedAt,
			"udch":                       oldRup.UpdatedAt,
		}
		_, errInsert := db.DbSippan.Exec(ctx, qInsert, args)
		if errInsert != nil {
			fmt.Println("unable to insert ref_rup, " + errInsert.Error())
		}
	}

	fmt.Println("Migrating tbl_rup_ut... SELESAI")
}

func truncateRefRup() {
	qTruncate := "TRUNCATE TABLE ref_rup"
	_, err := db.DbSippan.Exec(context.Background(), qTruncate)
	if err != nil {
		log.Fatal("qTruncate Failed, " + err.Error() + " " + qTruncate)
	}
}
