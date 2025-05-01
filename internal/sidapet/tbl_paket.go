package sidapet

import (
	"fmt"
	"promise-migration/internal/sidapet/helper"
	"promise-migration/internal/sidapet/model/sidapet/trxpenjaringanmodel"
	"promise-migration/internal/sidapet/model/vmsdb/tpaketmodel"
)

func MigrateTblPaket() {
	helper.TruncateTable("trx_kategori")
	helper.TruncateTable("trx_penjaringan")
	helper.TruncateTable("trx_verifikator_penjr")

	allVmsPaket := tpaketmodel.GetAllPaket()

	// loop semua data tbl_paket
	for _, vmsPaket := range allVmsPaket {
		trxpenjaringanmodel.InsertTrxPenjaringan(vmsPaket)
	}

	helper.UpdatePkSequence("trx_penjaringan", "kode_penjaringan")

	fmt.Println("Migrating tbl_paket... SELESAI")
}
