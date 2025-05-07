package trxpenjaringanmodel

import (
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
	"promise-migration/internal/sidapet/model/sidapet/tverifikatorpenjrmodel"
	"promise-migration/internal/sidapet/structs"
	"strconv"
	"strings"
)

type TrxPenjaringan struct {
	KodePenjaringan      pgtype.Int4
	KodeTrxKategori      pgtype.Int4
	NamaPenjaringan      pgtype.Text
	Keperluan            pgtype.Text
	KodeJenisPengadaan   pgtype.Int4
	KodeJenisVendor      pgtype.Int4
	Metode               pgtype.Text
	KodeKualifikasiUsaha pgtype.Bool
	FilePersyaratan      pgtype.Text
	StatusPersetujuan    pgtype.Text
	UserPersetujuan      pgtype.Text
	AlasanDitolak        pgtype.Text
	StatusPengajuanPjr   pgtype.Text
	StatusProsesPjr      pgtype.Text
	StatusPengumumanDpt  pgtype.Text
	TglDaftarAwal        pgtype.Timestamptz
	TglDaftarAkhir       pgtype.Timestamptz
	TglVerifikasiAwal    pgtype.Timestamptz
	TglVerifikasiAkhir   pgtype.Timestamptz
	TglEvaluasiAwal      pgtype.Timestamptz
	TglEvaluasiAkhir     pgtype.Timestamptz
	TglPengumuman        pgtype.Timestamptz
	StatusSTugas         pgtype.Text
	FileSTugas           pgtype.Text
	FilePengumuman       pgtype.Text
	Ucr                  pgtype.Text
	Udcr                 pgtype.Timestamptz
	Udch                 pgtype.Timestamptz
}

func InsertTrxPenjaringan(vmsPaket structs.VmsTblPaket) {

	ctx := context.Background()

	var statusPersetujuan string
	if vmsPaket.Status.Int32 == 1 {
		statusPersetujuan = "tolak"
	}
	if vmsPaket.Status.Int32 == 2 {
		statusPersetujuan = "terima"
	}

	qInsertPenjaringan := `
	  INSERT INTO trx_penjaringan (
	    "kode_penjaringan",
	    "nama_penjaringan",
	    "metode",
	    "status_persetujuan",
	    "tgl_daftar_awal",
	    "tgl_daftar_akhir",
	    "tgl_evaluasi_awal",
	    "tgl_evaluasi_akhir",
	    "tgl_pengumuman",
	    "udcr",
	    "udch"
	  ) VALUES (
	    @kode_penjaringan,
	    @nama_penjaringan,
	    @metode,
	    @status_persetujuan,
	    @tgl_daftar_awal,
	    @tgl_daftar_akhir,
	    @tgl_evaluasi_awal,
	    @tgl_evaluasi_akhir,
	    @tgl_pengumuman,
	    @udcr,
	    @udch)`

	args := pgx.NamedArgs{
		"kode_penjaringan":   vmsPaket.IdPaket,
		"nama_penjaringan":   vmsPaket.NamaPaket,
		"metode":             strings.ToLower(vmsPaket.Metode.String),
		"status_persetujuan": statusPersetujuan,
		"tgl_daftar_awal":    vmsPaket.TglDaftarAwal,
		"tgl_daftar_akhir":   vmsPaket.TglDaftarAkhir,
		"tgl_evaluasi_awal":  vmsPaket.TglEvalAwal,
		"tgl_evaluasi_akhir": vmsPaket.TglEvalAkhir,
		"tgl_pengumuman":     vmsPaket.TglUmumPaket,
		"udcr":               vmsPaket.CreatedAt,
		"udch":               vmsPaket.CreatedAt,
	}
	_, errInsert := db.DbSidapet.Exec(ctx, qInsertPenjaringan, args)
	if errInsert != nil {
		fmt.Println("unable to insert trx_penjaringan, " + errInsert.Error())
	}

	tverifikatorpenjrmodel.InsertTrxVerifikatorPenjr(vmsPaket)
}

func GetPenjaringanByKodePenjaringan(kodePenjaringan int) TrxPenjaringan {
	ctx := context.Background()

	var penjaringan TrxPenjaringan

	qPenjaringan := `
    SELECT
			kode_penjaringan,
			kode_trx_kategori,
			nama_penjaringan,
			keperluan,
			kode_jenis_pengadaan,
			kode_jenis_vendor,
			metode,
			kode_kualifikasi_usaha,
			file_persyaratan,
			status_persetujuan,
			user_persetujuan,
			alasan_ditolak,
			status_pengajuan_pjr,
			status_proses_pjr,
			status_pengumuman_dpt,
			tgl_daftar_awal,
			tgl_daftar_akhir,
			tgl_verifikasi_awal,
			tgl_verifikasi_akhir,
			tgl_evaluasi_awal,
			tgl_evaluasi_akhir,
			tgl_pengumuman,
			status_s_tugas,
			file_s_tugas,
			file_pengumuman,
			ucr,
			udcr,
			udch
    FROM trx_penjaringan
    WHERE kode_penjaringan = $1`

	rPenjaringan, errPjr := db.DbSidapet.Query(ctx, qPenjaringan, strconv.Itoa(kodePenjaringan))
	if errPjr != nil {
		log.Fatal("qPenjaringan Failed, " + errPjr.Error() + " " + qPenjaringan)
	}

	allPjr, errCollect := pgx.CollectRows(rPenjaringan, pgx.RowToStructByName[TrxPenjaringan])
	if errCollect != nil {
		log.Fatal("failed collecting allPjr, " + errCollect.Error())
	}
	defer rPenjaringan.Close()

	if len(allPjr) > 0 {
		penjaringan = allPjr[0]
	}

	return penjaringan
}
