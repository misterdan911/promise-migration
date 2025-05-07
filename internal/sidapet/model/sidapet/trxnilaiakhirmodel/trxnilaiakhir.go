package trxnilaiakhirmodel

import (
	"context"
	"database/sql"
	"fmt"
	"github.com/jackc/pgx/v5"
	"log"
	"promise-migration/db"
	"promise-migration/internal/sidapet/model/vmsdb/tverifmodel"
)

func InsertTrxNilaiakhir(kodeJenisVendor int, kodeVendorPenjr int, vTV tverifmodel.TblVerif) {

	ctx := context.Background()

	isAdministrasiLolos := sql.NullBool{Valid: true, Bool: false}
	nilaiPersonalia := sql.NullFloat64{}
	nilaiPeralatan := sql.NullFloat64{}
	nilaiPengalaman := sql.NullFloat64{}
	nilaiSertifikat := sql.NullFloat64{}
	isKeuanganLolos := sql.NullBool{Valid: true, Bool: false}
	nilaiLapKeuangan := sql.NullFloat64{}

	if kodeJenisVendor == 1 {
		if vTV.Terpilih.Int32 == 1 {
			isAdministrasiLolos.Bool = true
		} else if vTV.PerusLandasanHukum.Int32 == 1 && vTV.PerusPengurus.Int32 == 1 && vTV.PerusIzinUsaha.Int32 == 1 && vTV.PerusDataKeuangan.Int32 == 1 {
			isAdministrasiLolos.Bool = true
		}

		if vTV.PerusPersonalia.Float64 >= 0 {
			nilaiPersonalia.Valid = true
			nilaiPersonalia.Float64 = vTV.PerusPersonalia.Float64
		}

		if vTV.PerusFasilitas.Float64 >= 0 {
			nilaiPeralatan.Valid = true
			nilaiPeralatan.Float64 = vTV.PerusFasilitas.Float64
		}

		if vTV.PerusPengalaman.Float64 >= 0 {
			nilaiPengalaman.Float64 = vTV.PerusPengalaman.Float64
		}

		if vTV.PerusLapKeuangan.Float64 >= 0 {
			nilaiLapKeuangan.Float64 = vTV.PerusLapKeuangan.Float64
		}
	} else if kodeJenisVendor == 2 {
		if vTV.Terpilih.Int32 == 1 {
			isAdministrasiLolos.Bool = true
			isKeuanganLolos.Bool = true
		} else if vTV.OrgDataPribadi.Int32 == 1 && vTV.OrgNpwpPribadi.Int32 == 1 {
			isAdministrasiLolos.Bool = true
			isKeuanganLolos.Bool = true
		}

		if vTV.OrgPengalaman.Float64 >= 0 {
			nilaiPengalaman.Float64 = vTV.PerusPengalaman.Float64
		}
		if vTV.OrgSertifikat.Float64 >= 0 {
			nilaiSertifikat.Float64 = vTV.OrgSertifikat.Float64
		}
	} else {
		log.Fatal("Invalid Kode Jenis Vendor")
	}

	qIns := `
    INSERT INTO trx_nilai_akhir (
        kode_vendor_penjr,
        komen_administrasi,
        is_administrasi_lolos,
        komen_teknis,
        nilai_teknis,
        komen_personalia,
        nilai_personalia,
        komen_kantor,
        nilai_kantor,
        komen_peralatan,
        nilai_peralatan,
        komen_pengalaman,
        nilai_pengalaman,
        nilai_sertifikat,
        komen_keuangan,
        is_keuangan_lolos,
        nilai_lap_keu,
        nilai_total
    ) VALUES (
        @kode_vendor_penjr,
        @komen_administrasi,
        @is_administrasi_lolos,
        @komen_teknis,
        @nilai_teknis,
        @komen_personalia,
        @nilai_personalia,
        @komen_kantor,
        @nilai_kantor,
        @komen_peralatan,
        @nilai_peralatan,
        @komen_pengalaman,
        @nilai_pengalaman,
        @nilai_sertifikat,
        @komen_keuangan,
        @is_keuangan_lolos,
        @nilai_lap_keu,
        @nilai_total
    )`

	args := pgx.NamedArgs{
		"kode_vendor_penjr":     kodeVendorPenjr,
		"komen_administrasi":    sql.NullString{},
		"is_administrasi_lolos": isAdministrasiLolos,
		"komen_teknis":          sql.NullString{},
		"nilai_teknis":          sql.NullInt32{},
		"komen_personalia":      sql.NullString{},
		"nilai_personalia":      nilaiPersonalia,
		"komen_kantor":          sql.NullString{},
		"nilai_kantor":          sql.NullInt32{},
		"komen_peralatan":       sql.NullString{},
		"nilai_peralatan":       nilaiPeralatan,
		"komen_pengalaman":      sql.NullString{},
		"nilai_pengalaman":      nilaiPengalaman,
		"nilai_sertifikat":      nilaiSertifikat,
		"komen_keuangan":        sql.NullString{},
		"is_keuangan_lolos":     isKeuanganLolos,
		"nilai_lap_keu":         nilaiLapKeuangan,
		"nilai_total":           vTV.TotalNilai,
	}

	_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
	if errIns != nil {
		fmt.Println("unable to insert trx_nilai_akhir, " + errIns.Error())
	}
}
