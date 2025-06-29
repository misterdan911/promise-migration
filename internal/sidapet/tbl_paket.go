package sidapet

import (
 "fmt"
 "strings"
 "github.com/jackc/pgx/v5/pgtype"
 "promise-migration/internal/sidapet/model/sidapet/trxpenjaringanmodel"
 "promise-migration/internal/sidapet/model/sidapet/tverifikatorpenjrmodel"
 "promise-migration/internal/sidapet/model/vmsdb/tpaketmodel"
 "promise-migration/internal/sidapet/sidapethelper"
)

func MigrateTblPaket() {

  allVmsPaket := tpaketmodel.GetAllPaket()

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

    metode := pgtype.Text{Valid: true, String: strings.ToLower(vmsPaket.Metode.String)}

    trxPenjaringan := trxpenjaringanmodel.TrxPenjaringan{
     NamaPenjaringan:   vmsPaket.NamaPaket,
     Metode:            metode,
     StatusPersetujuan: statusPersetujuan,
     TglDaftarAwal:     vmsPaket.TglDaftarAwal,
     TglDaftarAkhir:    vmsPaket.TglDaftarAkhir,
     TglEvaluasiAwal:   vmsPaket.TglEvalAwal,
     TglEvaluasiAkhir:  vmsPaket.TglEvalAkhir,
     TglPengumuman:     vmsPaket.TglUmumPaket,
     Udcr:              vmsPaket.CreatedAt,
     Udch:              vmsPaket.CreatedAt,
    }

    kodePenjaringan := trxpenjaringanmodel.InsertTrxPenjaringan(trxPenjaringan)

    tverifikatorpenjrmodel.InsertTrxVerifikatorPenjr(kodePenjaringan, vmsPaket)
 }

 sidapethelper.UpdatePkSequence("trx_penjaringan", "kode_penjaringan")

 fmt.Println("Migrating tbl_paket... SELESAI")
}
