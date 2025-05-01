package trxpenjaringanmodel

import (
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"promise-migration/db"
	"promise-migration/internal/sidapet/model/sidapet/tverifikatorpenjrmodel"
	"promise-migration/internal/sidapet/structs"
	"strings"
)

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
