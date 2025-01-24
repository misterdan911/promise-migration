package sidapet

import (
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
	"promise-migration/internal/sidapet/helper"
	"strings"
)

type VmsPaket struct {
	IdPaket        pgtype.Int4
	NamaPaket      pgtype.Text
	Metode         pgtype.Text
	IdCabang       pgtype.Int4
	Status         pgtype.Int4
	TglDaftarAwal  pgtype.Timestamptz
	TglDaftarAkhir pgtype.Timestamptz
	TglEvalAwal    pgtype.Timestamptz
	TglEvalAkhir   pgtype.Timestamptz
	TglUmumPaket   pgtype.Timestamptz
	CreatedAt      pgtype.Timestamptz
}


func MigrateTblPaket() {
	helper.TruncateTable("trx_kategori")
	helper.TruncateTable("trx_penjaringan")
	helper.TruncateTable("trx_verifikator_penjr")

	// loop semua data tbl_paket
	ctx := context.Background()

	qTblPaket := `SELECT id_paket, nama_paket, metode, id_cabang, status, tgl_daftar_awal, tgl_daftar_akhir, tgl_eval_awal, tgl_eval_akhir, tgl_umum_paket, created_at
				  FROM tbl_paket ORDER BY id_paket`
	rwTblPaket, err := db.VmsDb.Query(ctx, qTblPaket)
	if err != nil {
		log.Fatal("qTblPaket Failed, " + err.Error() + " " + qTblPaket)
	}

	allVmsPaket, err := pgx.CollectRows(rwTblPaket, pgx.RowToStructByName[VmsPaket])
	if err != nil {
		log.Fatal("failed collecting rwTblPaket, " + err.Error())
	}
	defer rwTblPaket.Close()

	fmt.Println("Migrating tbl_paket...")

	for _, vmsPaket := range allVmsPaket {

		var statusPersetujuan string
		if vmsPaket.Status.Int32 == 1 {
			statusPersetujuan = "tolak"
		}
		if vmsPaket.Status.Int32 == 2 {
			statusPersetujuan = "terima"
		}

		qInsertPenjaringan := `INSERT INTO trx_penjaringan ("kode_penjaringan", "kode_cabang_ut", "nama_penjaringan", "metode", "status_persetujuan", "tgl_daftar_awal", "tgl_daftar_akhir", "tgl_evaluasi_awal", "tgl_evaluasi_akhir", "tgl_pengumuman", "udcr", "udch") VALUES (@kode_penjaringan, @kode_cabang_ut, @nama_penjaringan, @metode, @status_persetujuan, @tgl_daftar_awal, @tgl_daftar_akhir, @tgl_evaluasi_awal, @tgl_evaluasi_akhir, @tgl_pengumuman, @udcr, @udch)`
		args := pgx.NamedArgs{
			"kode_penjaringan":   vmsPaket.IdPaket,
			"kode_cabang_ut":     vmsPaket.IdCabang,
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

    MigrateTblVerifPaket(vmsPaket.IdPaket)
	}

	qUpdateKodePjrSeq := `SELECT setval('trx_penjaringan_kode_penjaringan_seq', (SELECT MAX(kode_penjaringan) FROM trx_penjaringan))`
	_, errUpdateSeq := db.DbSidapet.Exec(ctx, qUpdateKodePjrSeq)
	if errUpdateSeq != nil {
		log.Fatal("qUpdateKodePjrSeq Failed, " + errUpdateSeq.Error() + " " + qUpdateKodePjrSeq)
	}

	fmt.Println("Migrating tbl_paket... SELESAI")

}
