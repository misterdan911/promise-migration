package refrupmodel

import (
	"context"
	"log"
	// "fmt"
	// "os"
	"strings"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type RefRup struct {
	KodeRup                 pgtype.Int4
	NoRup                   pgtype.Text
	NoDrauk                 pgtype.Int4
	KodeUnit                pgtype.Text
	SumberDana              pgtype.Text
	NamaPaket               pgtype.Text
	UraianSpekKerja         pgtype.Text
	VolumePekerjaan         pgtype.Text
	SatuanVolume            pgtype.Text
	KodeKabKota             pgtype.Text
	Lokasi                  pgtype.Text
	DetailLokasi            pgtype.Text
	TahunAnggaran           pgtype.Int4
	ProdDalamNegri          pgtype.Text // ya_tidak enum type
	IsKualifikasiK          pgtype.Bool
	IsKualifikasiM          pgtype.Bool
	IsKualifikasiB          pgtype.Bool
	JmlPagu                 pgtype.Numeric
	IsPraDrauk              pgtype.Bool
	KodeJenisPengadaan      pgtype.Int4
	KodeKatMetode           pgtype.Int4
	KodeMetodePengadaan     pgtype.Int4
	TglRencPemilihanAwal    pgtype.Date
	TglRencPemilihanAkhir   pgtype.Date
	TglRencPelaksanaanAwal  pgtype.Date
	TglRencPelaksanaanAkhir pgtype.Date
	TglRencPemanfaatanAwal  pgtype.Date
	TglRencPemanfaatanAkhir pgtype.Date
	StatusRup               pgtype.Text // status_rup enum type
	Ucr                     pgtype.Text
	Uch                     pgtype.Text
	Udcr                    pgtype.Timestamptz
	Udch                    pgtype.Timestamptz
	StatusRupDigunakan      pgtype.Text
	MultiYears              pgtype.Bool
	JmlPaguEks              pgtype.Numeric
}

type KodeNoRup struct {
	KodeRup pgtype.Int4
	NoRup   pgtype.Text
}

func DeleteByUcr(email pgtype.Text) {

  ctx := context.Background()

  qDelete := `DELETE FROM ref_rup WHERE ucr = $1`
  _, err := db.DbSippan.Exec(ctx, qDelete, email)
  if err != nil {
    log.Fatal("failed deleting RefRup (ref_rup.go), " + err.Error())
  }

}

func GetKodeRupByNoRup(noRup pgtype.Text) pgtype.Int4 {

	ctx := context.Background()
	noRup.String = strings.TrimSpace(noRup.String)
	qSelect := `
	SELECT 
		kode_rup,
		no_rup
	FROM 
		ref_rup
	WHERE 
		no_rup = $1
	`
	var kodeNoRup KodeNoRup

	err := db.DbSippan.QueryRow(ctx, qSelect, noRup).Scan(
		&kodeNoRup.KodeRup,
		&kodeNoRup.NoRup,
	)
	if err != nil {
		// fmt.Fprintf(os.Stderr, "GetKodeRupByNoRup return null value: %v\n", err)
		return pgtype.Int4{}
	}

	return kodeNoRup.KodeRup
}


func UpdateNoDrauk(kodeRup pgtype.Int4, noDrauk pgtype.Int4) {

	ctx := context.Background()

	qUpdate := `UPDATE ref_rup SET no_drauk = $1 WHERE kode_rup = $2`
  _, err := db.DbSippan.Exec(ctx, qUpdate, noDrauk, kodeRup)

  if err != nil {
    log.Fatal("failed updating RefRup (ref_rup.go), " + err.Error())
  }
}


func GetByKodeRup(kodeRup pgtype.Int4) RefRup {
	var refRup RefRup
	ctx := context.Background()

	qRefRup := `
	SELECT
		kode_rup,
		no_rup,
		no_drauk,
		kode_unit,
		sumber_dana,
		nama_paket,
		uraian_spek_kerja,
		volume_pekerjaan,
		satuan_volume,
		kode_kab_kota,
		lokasi,
		detail_lokasi,
		tahun_anggaran,
		prod_dalam_negri,
		is_kualifikasi_k,
		is_kualifikasi_m,
		is_kualifikasi_b,
		jml_pagu,
		is_pra_drauk,
		kode_jenis_pengadaan,
		kode_kat_metode,
		kode_metode_pengadaan,
		tgl_renc_pemilihan_awal,
		tgl_renc_pemilihan_akhir,
		tgl_renc_pelaksanaan_awal,
		tgl_renc_pelaksanaan_akhir,
		tgl_renc_pemanfaatan_awal,
		tgl_renc_pemanfaatan_akhir,
		status_rup,
		ucr,
		uch,
		udcr,
		udch,
		status_rup_digunakan,
		multi_years,
		jml_pagu_eks
	FROM ref_rup
	WHERE kode_rup = $1`

	rwRefRup, err := db.DbSippan.Query(ctx, qRefRup, kodeRup)
	if err != nil {
		log.Fatal("qRefRup Failed, " + err.Error() + " " + qRefRup)
	}
	defer rwRefRup.Close()

	allRup, err := pgx.CollectRows(rwRefRup, pgx.RowToStructByName[RefRup])
	if err != nil {
		log.Fatal("failed collecting rwRefRup (refrupmodel.go:GetByKodeRup), " + err.Error())
	}

	if len(allRup) > 0 {
		refRup = allRup[0]
	}

	return refRup
}
