package sippan

import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"strings"
	"promise-migration/db"
	"promise-migration/internal/g"
	// "promise-migration/internal/model/dbsidapet/helperusermodel"
	// "promise-migration/internal/model/dbusman/trxgroupusermodel"
	"promise-migration/internal/sippan/sippanhelper"
	"promise-migration/internal/model/vmsdb/usermodel"
	"slices"
	// "strconv"
	"time"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type OldRupUt struct {
	IdRupUt                 int
	KodeUnit                string
	KodeUnitLama            pgtype.Text
	IdUser                  pgtype.Int4
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

	fmt.Println("Migrating tbl_rup_ut...")

	var err error
	ctx := context.Background()

	qRuptUt := `
	SELECT
		id_rup_ut, kode_unit, kode_unit_lama, id_user, nomor_rup_ut, nama_paket, lokasi, detail_lokasi, tahun_anggaran, uraian_pekerjaan, spesifikasi_pekerjaan, volume_pekerjaan, satuan, produk_dalam_negeri, usaha, jumlah_pagu, pra_dipa, izin_tahun_jamak, metode_pengadaan, jenis_pengadaan, rencana_pemilihan, rencana_pemilihan_akhir, rencana_pelaksanaan, rencana_pelaksanaan_akhir, rencana_pemanfaatan, rencana_pemanfaatan_akhir, created_at, updated_at, status_rup
	FROM tbl_rup_ut ORDER BY id_rup_ut ASC`

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

		skipUser := slices.Contains(g.ExcludedVmsUserId, oldRup.IdUser.Int32)
		if skipUser {
			continue
		}

		uraian_spek_kerja := sippanhelper.GetUraianSpekKerja(oldRup.UraianPekerjaan.String, oldRup.SpesifikasiPekerjaan.String)

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
		tglRencPemilihanAwal := sippanhelper.ConvertToFirstDayOfMonth(oldRup.RencanaPemilihan.String)
		tglRencPemilihanAkhir := sippanhelper.ConvertToLastDayOfMonth(oldRup.RencanaPemilihanAkhir.String)
		tglRencPelaksanaanAwal := sippanhelper.ConvertToFirstDayOfMonth(oldRup.RencanaPelaksanaan.String)
		tglRencPelaksanaanAkhir := sippanhelper.ConvertToLastDayOfMonth(oldRup.RencanaPelaksanaanAkhir.String)
		tglRencPemanfaatanAwal := sippanhelper.ConvertToFirstDayOfMonth(oldRup.RencanaPemilihan.String)
		tglRencPemanfaatanAkhir := sippanhelper.ConvertToLastDayOfMonth(oldRup.RencanaPemilihanAkhir.String)

		/*
		helperUser := helperusermodel.GetByVmsUserId(oldRup.IdUser)

		if (helperUser == helperusermodel.HelperUser{}) {
			fmt.Println("vms_user_id: " + strconv.Itoa(int(oldRup.IdUser.Int32)) + " tidak ada di helper_user (data not migrated)")
			continue
		}
		*/

		userUcr := usermodel.GetUserById(oldRup.IdUser)

		multiYears := GetMultiYears(oldRup)

		qInsert := `INSERT INTO ref_rup (kode_rup, no_rup, no_drauk, multi_years, kode_unit, nama_paket, uraian_spek_kerja, volume_pekerjaan, satuan_volume, kode_kab_kota, lokasi, detail_lokasi, tahun_anggaran, prod_dalam_negri, is_kualifikasi_k, is_kualifikasi_m, is_kualifikasi_b, jml_pagu, is_pra_drauk, kode_jenis_pengadaan, kode_metode_pengadaan, tgl_renc_pemilihan_awal, tgl_renc_pemilihan_akhir, tgl_renc_pelaksanaan_awal, tgl_renc_pelaksanaan_akhir, tgl_renc_pemanfaatan_awal, tgl_renc_pemanfaatan_akhir, status_rup, ucr, uch, udcr, udch)
		VALUES (@kode_rup, @no_rup, @no_drauk, @multi_years, @kode_unit, @nama_paket, @uraian_spek_kerja, @volume_pekerjaan, @satuan_volume, @kode_kab_kota, @lokasi, @detail_lokasi, @tahun_anggaran, @prod_dalam_negri, @is_kualifikasi_k, @is_kualifikasi_m, @is_kualifikasi_b, @jml_pagu, @is_pra_drauk, @kode_jenis_pengadaan, @kode_metode_pengadaan, @tgl_renc_pemilihan_awal, @tgl_renc_pemilihan_akhir, @tgl_renc_pelaksanaan_awal, @tgl_renc_pelaksanaan_akhir, @tgl_renc_pemanfaatan_awal, @tgl_renc_pemanfaatan_akhir, @status_rup, @ucr, @uch, @udcr, @udch)`
		args := pgx.NamedArgs{
			"kode_rup":                   oldRup.IdRupUt,
			"no_rup":                     oldRup.NomorRupUt.String,
			"no_drauk":                   sql.NullInt16{Valid: false}, // Tidak ada datanya dari DB lama
			"multi_years":                multiYears,
			"kode_unit":                  oldRup.KodeUnit,
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
			"ucr":                        userUcr.EmailReal,
			"uch":                        sql.NullTime{Valid: false},
			"udcr":                       oldRup.CreatedAt,
			"udch":                       oldRup.UpdatedAt,
		}
		_, errInsert := db.DbSippan.Exec(ctx, qInsert, args)
		if errInsert != nil {
			log.Fatal("unable to insert ref_rup, " + errInsert.Error())
		}

		// kalau levelnya adalah PPK, proses data di db_usman.tabel trx_group_user
		// supaya user tersebut punya role sebagai PPK di aplikasi Si-Ppan
		/*
		if helperUser.VmsUserLevel.Int32 == 7 {
			kodeGroup := pgtype.Text{Valid: true, String: "G03.2"}
			idUser := helperUser.UsmanRefUserId
			trxgroupusermodel.InsertIfNotExists(kodeGroup, idUser)
		}
		*/
	}

	fmt.Println("Migrating tbl_rup_ut... SELESAI")
}

func GetMultiYears(oldRup OldRupUt) pgtype.Bool{

	var multiYears pgtype.Bool
	multiYears.Valid = true

	switch strings.TrimSpace(oldRup.IzinTahunJamak.String){
	case "2020" :
		fmt.Println("2020")
		multiYears.Bool = true
	case "2021" :
		fmt.Println("2021")
		multiYears.Bool = true
	case "2022":
		fmt.Println("2022")
		multiYears.Bool = true
	case "2023":
		fmt.Println("2023")
		multiYears.Bool = true
	case "2024":
		fmt.Println("2024")
		multiYears.Bool = true
	default:
		str := oldRup.IzinTahunJamak.String
		if strings.Contains(str, ".") && strings.Contains(str, "/") {
			multiYears.Bool = true
		} else {
			multiYears.Bool = false
		}
	}

	return multiYears
}
