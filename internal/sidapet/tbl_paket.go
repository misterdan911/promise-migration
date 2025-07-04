package sidapet

import (
	"fmt"
	"promise-migration/internal/model/vmsdb/tblpaketmodel"
	"promise-migration/internal/sidapet/model/sidapet/trxpenjaringanmodel"
	"promise-migration/internal/sidapet/model/sidapet/trxverifikatorpenjrmodel"
	"promise-migration/internal/sidapet/sidapethelper"
	"strings"
	"time"

	"github.com/jackc/pgx/v5/pgtype"
)

func MigrateTblPaket() {

	allVmsPaket := tblpaketmodel.GetAllData()

	// loop semua data vms_db.tbl_paket
	for _, vmsPaket := range allVmsPaket {

		var statusPersetujuan pgtype.Text
		if vmsPaket.Status.Int32 == 1 {
			statusPersetujuan.Valid = true
			statusPersetujuan.String = "tolak"
		}
		if vmsPaket.Status.Int32 == 2 {
			statusPersetujuan.Valid = true
			statusPersetujuan.String = "terima"
		}

		var statusProsesPjr pgtype.Text
		var statusPengumumanDpt pgtype.Text
		paketTime := vmsPaket.TglUmumPaket.Time    // Get the time value from pgtype.Timestamptz
		now := time.Now().In(paketTime.Location()) // Get current time in the same location as paketTime
		if now.After(paketTime) {
			statusProsesPjr.Valid = true
			statusProsesPjr.String = "selesai"
			statusPengumumanDpt.Valid = true
			statusPengumumanDpt.String = "selesai"
		}

		metode := pgtype.Text{Valid: true, String: strings.ToLower(vmsPaket.Metode.String)}

		trxPenjaringan := trxpenjaringanmodel.TrxPenjaringan{
			NamaPenjaringan:     vmsPaket.NamaPaket,
			Metode:              metode,
			FilePersyaratan:     vmsPaket.PathPaket,
			KodeStatusPengajuan: pgtype.Int4{Valid: true, Int32: 5},
			StatusPersetujuan:   statusPersetujuan,
			StatusPengajuanPjr:  pgtype.Text{Valid: true, String: "selesai"},
			StatusProsesPjr:     statusProsesPjr,
			StatusPengumumanDpt: statusPengumumanDpt,
			TglDaftarAwal:       vmsPaket.TglDaftarAwal,
			TglDaftarAkhir:      vmsPaket.TglDaftarAkhir,
			TglEvaluasiAwal:     vmsPaket.TglEvalAwal,
			TglEvaluasiAkhir:    vmsPaket.TglEvalAkhir,
			TglPengumuman:       vmsPaket.TglUmumPaket,
			Ucr:                 pgtype.Text{Valid: true, String: "upbj@gmail.com"},
			Udcr:                vmsPaket.CreatedAt,
			Udch:                vmsPaket.CreatedAt,
		}

		kodePenjaringan := trxpenjaringanmodel.InsertTrxPenjaringan(trxPenjaringan)
		trxverifikatorpenjrmodel.InsertTrxVerifikatorPenjr(kodePenjaringan, vmsPaket)
		MigrateTblPaketUndang(vmsPaket, kodePenjaringan)
	}

	sidapethelper.UpdatePkSequence("trx_penjaringan", "kode_penjaringan")

	fmt.Println("Migrating tbl_paket... SELESAI")
}
