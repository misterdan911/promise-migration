package rpengalamanbumodel

import (
	"context"
	"database/sql"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
	"promise-migration/internal/sidapet/helper"
	"promise-migration/internal/structs"
	"strconv"
	"strings"
)

type VmsTblPengalaman10 struct {
	IdPengalaman10     pgtype.Int4
	IdProfilPenyedia   pgtype.Int4
	NmPnglmn10         pgtype.Text
	DivPnglmn10        pgtype.Text
	RingkasPnglmn10    pgtype.Text
	LokPnglmn10        pgtype.Text
	PemberiPnglmn10    pgtype.Text
	AlamatPnglmn10     pgtype.Text
	TglPnglmn10        pgtype.Text
	NilaiPnglmn10      pgtype.Text
	StatusPnglmn10     pgtype.Text
	TglSelesaiPnglmn10 pgtype.Text
	BaPnglmn10         pgtype.Text
	PathPnglmn10       pgtype.Text
}

type VmsTblPengalaman3 struct {
	IdPengalaman3     pgtype.Int4
	IdProfilPenyedia  pgtype.Int4
	NmPnglmn3         pgtype.Text
	DivPnglmn3        pgtype.Text
	RingkasPnglmn3    pgtype.Text
	LokPnglmn3        pgtype.Text
	PemberiPnglmn3    pgtype.Text
	AlamatPnglmn3     pgtype.Text
	TglPnglmn3        pgtype.Text
	NilaiPnglmn3      pgtype.Text
	StatusPnglmn3     pgtype.Text
	TglSelesaiPnglmn3 pgtype.Text
	BaPnglmn3         pgtype.Text
	PathPnglmn3       pgtype.Text
}

type VmsTblPengalamanSekarang struct {
	IdPengalamanSekarang   pgtype.Int4
	IdProfilPenyedia       pgtype.Int4
	NmPnglmnSekarang       pgtype.Text
	DivPnglmnSekarang      pgtype.Text
	RingkasPnglmnSekarang  pgtype.Text
	LokPnglmnSekarang      pgtype.Text
	PemberiPnglmnSekarang  pgtype.Text
	AlamatPnglmnSekarang   pgtype.Text
	TglPnglmnSekarang      pgtype.Text
	NilaiPnglmnSekarang    pgtype.Text
	StatusPnglmnSekarang   pgtype.Text
	KontrakPnglmnSekarang  pgtype.Text
	PrestasiPnglmnSekarang pgtype.Text
	PathPnglmnSkrg         pgtype.Text
}

type RefPengalamanBu struct {
	KodePengalamanBu    pgtype.Int4
	KodeVendor          pgtype.Int4
	NamaPekerjaan       pgtype.Text
	TahunPekerjaan      pgtype.Int4
	PemberiKerja        pgtype.Text
	NilaiPekerjaan      pgtype.Int8
	TglAwalPekerjaan    pgtype.Date
	TglAkhirPekerjaan   pgtype.Text
	NoKontrak           pgtype.Text
	FileKontrak         pgtype.Text
	IsKontrakSelamanya  pgtype.Bool
	KontrakBerlakuAwal  pgtype.Date
	KontrakBerlakuAkhir pgtype.Date
	EncryptKeyKontrak   pgtype.Text
	FileBast            pgtype.Text
	IsBastSelamanya     pgtype.Bool
	BastBerlakuAwal     pgtype.Date
	BastBerlakuAkhir    pgtype.Date
	EncryptKeyBast      pgtype.Text
}

func InsertPengalaman(profilePenyedia structs.TblProfilePenyedia) {

	if profilePenyedia.IdJenisPenyedia.Int32 == 2 {
		return
	}

	var allPengalaman []RefPengalamanBu
	allPengalaman = GetPengalaman10(profilePenyedia)
	InsertRefPengalamanBu(allPengalaman)

	allPengalaman = GetPengalaman3(profilePenyedia)
	InsertRefPengalamanBu(allPengalaman)

	allPengalaman = GetPengalamanSekarang(profilePenyedia)
	InsertRefPengalamanBu(allPengalaman)
}

func GetPengalaman10(profilePenyedia structs.TblProfilePenyedia) []RefPengalamanBu {
	ctx := context.Background()

	qPengalaman := `
	SELECT
	  id_pengalaman10,
	  id_profil_penyedia,
	  nm_pnglmn_10,
	  div_pnglmn_10,
	  ringkas_pnglmn_10,
	  lok_pnglmn_10,
	  pemberi_pnglmn_10,
	  alamat_pnglmn_10,
	  tgl_pnglmn_10,
	  nilai_pnglmn_10,
	  status_pnglmn_10,
	  tgl_selesai_pnglmn_10,
	  ba_pnglmn_10,
	  path_pnglmn_10
	FROM tbl_pengalaman10
	WHERE id_profil_penyedia = $1
	ORDER BY id_pengalaman10`

	rPengalaman, errVTK := db.VmsDb.Query(ctx, qPengalaman, strconv.Itoa(int(profilePenyedia.IdProfilPenyedia.Int32)))
	if errVTK != nil {
		log.Fatal("qPengalaman Failed, " + errVTK.Error() + " " + qPengalaman)
	}

	allPengalaman, errCollect := pgx.CollectRows(rPengalaman, pgx.RowToStructByName[VmsTblPengalaman10])
	if errCollect != nil {
		log.Fatal("failed collecting rows, " + errCollect.Error())
	}
	defer rPengalaman.Close()

	var allRefPengalaman []RefPengalamanBu

	for _, pengalaman := range allPengalaman {

		nilaiPekerjaan := GetNilaiPekerjaan(pengalaman.IdPengalaman10.Int32, pengalaman.NilaiPnglmn10.String, "id_pengalaman_10")
		tahunPekerjaan := GetTahunpekerjaan(pengalaman.TglPnglmn10.String)
		tglAkhirPekerjaan := GetTglAkhirPekerjaan(pengalaman.TglSelesaiPnglmn10.String)

		allRefPengalaman = append(allRefPengalaman, RefPengalamanBu{
			KodeVendor:        profilePenyedia.IdProfilPenyedia,
			NamaPekerjaan:     pengalaman.NmPnglmn10,
			TahunPekerjaan:    tahunPekerjaan, // harus ada proses lebih lanjut
			PemberiKerja:      pengalaman.PemberiPnglmn10,
			NilaiPekerjaan:    nilaiPekerjaan,    // harus ada proses lebuh lanjut
			TglAkhirPekerjaan: tglAkhirPekerjaan, // harus ada proses lebuh lanjut
			NoKontrak:         pgtype.Text{},
			FileKontrak:       pengalaman.PathPnglmn10,
			FileBast:          pgtype.Text{},
		})
	}

	return allRefPengalaman
}

func GetPengalaman3(profilePenyedia structs.TblProfilePenyedia) []RefPengalamanBu {
	ctx := context.Background()

	qPengalaman := `
	SELECT
	  id_pengalaman3,
	  id_profil_penyedia,
	  nm_pnglmn_3,
	  div_pnglmn_3,
	  ringkas_pnglmn_3,
	  lok_pnglmn_3,
	  pemberi_pnglmn_3,
	  alamat_pnglmn_3,
	  tgl_pnglmn_3,
	  nilai_pnglmn_3,
	  status_pnglmn_3,
	  tgl_selesai_pnglmn_3,
	  ba_pnglmn_3,
	  path_pnglmn_3
	FROM tbl_pengalaman3
	WHERE id_profil_penyedia = $1
	ORDER BY id_pengalaman3`

	rPengalaman, errVTK := db.VmsDb.Query(ctx, qPengalaman, strconv.Itoa(int(profilePenyedia.IdProfilPenyedia.Int32)))
	if errVTK != nil {
		log.Fatal("qPengalaman Failed, " + errVTK.Error() + " " + qPengalaman)
	}

	allPengalaman, errCollect := pgx.CollectRows(rPengalaman, pgx.RowToStructByName[VmsTblPengalaman3])
	if errCollect != nil {
		log.Fatal("failed collecting rows, " + errCollect.Error())
	}
	defer rPengalaman.Close()

	var allRefPengalaman []RefPengalamanBu

	for _, pengalaman := range allPengalaman {

		nilaiPekerjaan := GetNilaiPekerjaan(pengalaman.IdPengalaman3.Int32, pengalaman.NilaiPnglmn3.String, "id_pengalaman_3")
		tahunPekerjaan := GetTahunpekerjaan(pengalaman.TglPnglmn3.String)
		tglAkhirPekerjaan := GetTglAkhirPekerjaan(pengalaman.TglSelesaiPnglmn3.String)

		allRefPengalaman = append(allRefPengalaman, RefPengalamanBu{
			KodeVendor:        profilePenyedia.IdProfilPenyedia,
			NamaPekerjaan:     pengalaman.NmPnglmn3,
			TahunPekerjaan:    tahunPekerjaan, // harus ada proses lebih lanjut
			PemberiKerja:      pengalaman.PemberiPnglmn3,
			NilaiPekerjaan:    nilaiPekerjaan,    // harus ada proses lebuh lanjut
			TglAkhirPekerjaan: tglAkhirPekerjaan, // harus ada proses lebuh lanjut
			NoKontrak:         pgtype.Text{},
			FileKontrak:       pengalaman.PathPnglmn3,
			FileBast:          pgtype.Text{},
		})
	}

	return allRefPengalaman
}

func GetPengalamanSekarang(profilePenyedia structs.TblProfilePenyedia) []RefPengalamanBu {
	ctx := context.Background()

	qPengalaman := `
	SELECT
	  id_pengalaman_sekarang,
	  id_profil_penyedia,
	  nm_pnglmn_sekarang,
	  div_pnglmn_sekarang,
	  ringkas_pnglmn_sekarang,
	  lok_pnglmn_sekarang,
	  pemberi_pnglmn_sekarang,
	  alamat_pnglmn_sekarang,
	  tgl_pnglmn_sekarang,
	  nilai_pnglmn_sekarang,
	  status_pnglmn_sekarang,
	  kontrak_pnglmn_sekarang,
	  prestasi_pnglmn_sekarang,
	  path_pnglmn_skrg
	FROM tbl_pengalaman_sekarang
	WHERE id_profil_penyedia = $1
	ORDER BY id_pengalaman_sekarang`

	rPengalaman, errVTK := db.VmsDb.Query(ctx, qPengalaman, strconv.Itoa(int(profilePenyedia.IdProfilPenyedia.Int32)))
	if errVTK != nil {
		log.Fatal("qPengalaman Failed, " + errVTK.Error() + " " + qPengalaman)
	}

	allPengalaman, errCollect := pgx.CollectRows(rPengalaman, pgx.RowToStructByName[VmsTblPengalamanSekarang])
	if errCollect != nil {
		log.Fatal("failed collecting rows, " + errCollect.Error())
	}
	defer rPengalaman.Close()

	var allRefPengalaman []RefPengalamanBu

	for _, pengalaman := range allPengalaman {

		nilaiPekerjaan := GetNilaiPekerjaan(pengalaman.IdPengalamanSekarang.Int32, pengalaman.NilaiPnglmnSekarang.String, "id_pengalaman_sekarang")
		tahunPekerjaan := GetTahunpekerjaan(pengalaman.TglPnglmnSekarang.String)

		allRefPengalaman = append(allRefPengalaman, RefPengalamanBu{
			KodeVendor:     profilePenyedia.IdProfilPenyedia,
			NamaPekerjaan:  pengalaman.NmPnglmnSekarang,
			TahunPekerjaan: tahunPekerjaan, // harus ada proses lebih lanjut
			PemberiKerja:   pengalaman.PemberiPnglmnSekarang,
			NilaiPekerjaan: nilaiPekerjaan, // harus ada proses lebuh lanjut
			NoKontrak:      pgtype.Text{},
			FileKontrak:    pengalaman.PathPnglmnSkrg,
			FileBast:       pgtype.Text{},
		})
	}

	return allRefPengalaman
}

func InsertRefPengalamanBu(allPengalaman []RefPengalamanBu) {

	ctx := context.Background()

	for _, pengalaman := range allPengalaman {
		qIns := `
		INSERT INTO ref_pengalaman_bu (
		  kode_vendor,
		  nama_pekerjaan,
		  tahun_pekerjaan,
		  pemberi_kerja,
		  nilai_pekerjaan,
		  tgl_awal_pekerjaan,
		  tgl_akhir_pekerjaan,
		  no_kontrak,
		  file_kontrak,
		  file_bast
		) VALUES (
		  @kode_vendor,
		  @nama_pekerjaan,
		  @tahun_pekerjaan,
		  @pemberi_kerja,
		  @nilai_pekerjaan,
		  @tgl_awal_pekerjaan,
		  @tgl_akhir_pekerjaan,
		  @no_kontrak,
		  @file_kontrak,
		  @file_bast
		)`

		args := pgx.NamedArgs{
			"kode_vendor":         pengalaman.KodeVendor,
			"nama_pekerjaan":      pengalaman.NamaPekerjaan,
			"tahun_pekerjaan":     pengalaman.TahunPekerjaan,
			"pemberi_kerja":       pengalaman.PemberiKerja,
			"nilai_pekerjaan":     pengalaman.NilaiPekerjaan,
			"tgl_awal_pekerjaan":  sql.NullTime{},
			"tgl_akhir_pekerjaan": pengalaman.TglAkhirPekerjaan,
			"no_kontrak":          pengalaman.NoKontrak,
			"file_kontrak":        pengalaman.FileKontrak,
			"file_bast":           pengalaman.FileBast,
		}

		_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
		if errIns != nil {
			fmt.Println("nama_pekerjaan: " + pengalaman.NamaPekerjaan.String + helper.GetLen(pengalaman.NamaPekerjaan.String))
			fmt.Println("pemberi_kerja: " + pengalaman.PemberiKerja.String + helper.GetLen(pengalaman.PemberiKerja.String))
			fmt.Println("file_kontrak: " + pengalaman.FileKontrak.String + helper.GetLen(pengalaman.FileKontrak.String))
			fmt.Println("file_bast: " + pengalaman.FileBast.String + helper.GetLen(pengalaman.FileBast.String))
			log.Fatal("unable to insert ref_pengalaman_bu, " + errIns.Error())
		}
	}
}

func GetNilaiPekerjaan(idPengalaman int32, strNilaiPengalaman string, fieldName string) pgtype.Int8 {
	nP, errNP := helper.ParseNilaiPengalaman(strNilaiPengalaman)
	var nilaiPekerjaan pgtype.Int8
	if errNP != nil {
		fmt.Println("errNP", errNP)
		helper.Log("pengalaman_bu.txt", "errNP: "+errNP.Error())
	}
	nilaiPekerjaan = pgtype.Int8{Valid: true, Int64: nP}
	helper.Log("pengalaman_bu.txt", fieldName+": "+strconv.Itoa(int(idPengalaman)))
	helper.Log("pengalaman_bu.txt", "nilai_pengalaman: "+strNilaiPengalaman+" --> "+strconv.FormatInt(nP, 10))
	helper.Log("pengalaman_bu.txt", "")

	return nilaiPekerjaan
}

func GetTahunpekerjaan(tglPengalaman string) pgtype.Int4 {
	year := 2006

	for year < 2026 {
		if strings.Contains(tglPengalaman, strconv.Itoa(year)) {
			return pgtype.Int4{Valid: true, Int32: int32(year)}
		}
		year++
	}

	return pgtype.Int4{}
}

func GetTglAkhirPekerjaan(tglSelesaiPekerjaan string) pgtype.Text {
	var tgl pgtype.Text

	strTgl, err := helper.ConvertToPostgresDate(tglSelesaiPekerjaan)

	if err == nil {
		tgl.Valid = true
		tgl.String = strTgl
	}

	return tgl
}
