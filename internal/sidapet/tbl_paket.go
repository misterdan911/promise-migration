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
	NamaPaket      pgtype.Text
	Metode         pgtype.Text
	Status         pgtype.Int4
	TglDaftarAwal  pgtype.Timestamptz
	TglDaftarAkhir pgtype.Timestamptz
	TglEvalAwal    pgtype.Timestamptz
	TglEvalAkhir   pgtype.Timestamptz
	TglUmumPaket   pgtype.Timestamptz
	CreatedAt   pgtype.Timestamptz
}

func MigrateTblPaket() {
	helper.TruncateTable("trx_kategori")
	helper.TruncateTable("trx_penjaringan")

	// loop semua data tbl_paket
	ctx := context.Background()

	qTblPaket := `SELECT nama_paket, metode, status, tgl_daftar_awal, tgl_daftar_akhir, tgl_eval_awal, tgl_eval_akhir, tgl_umum_paket, created_at
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

	for _, vmsPaket := range allVmsPaket {

		var statusPersetujuan string
		if vmsPaket.Status.Int32 == 1 {
			statusPersetujuan = "tolak"
		}
		if vmsPaket.Status.Int32 == 2 {
			statusPersetujuan = "terima"
		}

		qInsertPenjaringan := `INSERT INTO trx_penjaringan ("nama_penjaringan", "metode", "status_persetujuan", "tgl_daftar_awal", "tgl_daftar_akhir", "tgl_evaluasi_awal", "tgl_evaluasi_akhir", "tgl_pengumuman", "udcr", "udch") VALUES (@nama_penjaringan, @metode, @status_persetujuan, @tgl_daftar_awal, @tgl_daftar_akhir, @tgl_evaluasi_awal, @tgl_evaluasi_akhir, @tgl_pengumuman, @udcr, @udch)`
		args := pgx.NamedArgs{
			"nama_penjaringan":   vmsPaket.NamaPaket,
			"metode":             strings.ToLower(vmsPaket.Metode.String),
			"status_persetujuan": statusPersetujuan,
			"tgl_daftar_awal":    vmsPaket.TglDaftarAwal,
			"tgl_daftar_akhir":   vmsPaket.TglDaftarAkhir,
			"tgl_evaluasi_awal":  vmsPaket.TglEvalAwal,
			"tgl_evaluasi_akhir": vmsPaket.TglEvalAkhir,
			"tgl_pengumuman":     vmsPaket.TglUmumPaket,
			"udcr":     vmsPaket.CreatedAt,
			"udch":     vmsPaket.CreatedAt,
		}
		_, errInsert := db.DbSidapet.Exec(ctx, qInsertPenjaringan, args)
		if errInsert != nil {
			fmt.Println("unable to insert trx_penjaringan, " + errInsert.Error())
		}

		fmt.Println(vmsPaket.NamaPaket.String)
	}

}
