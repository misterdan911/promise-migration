package sidapet

import (
	"fmt"
	"promise-migration/internal/sidapet/model/sidapet/trxpenjaringanmodel"
	"promise-migration/internal/sidapet/model/vmsdb/tpaketmodel"
	"promise-migration/internal/sidapet/sidapethelper"
)

func MigrateTblPaket() {

	allVmsPaket := tpaketmodel.GetAllPaket()

	// loop semua data tbl_paket
	for _, vmsPaket := range allVmsPaket {
		trxpenjaringanmodel.InsertTrxPenjaringan(vmsPaket)
	}

	sidapethelper.UpdatePkSequence("trx_penjaringan", "kode_penjaringan")

	fmt.Println("Migrating tbl_paket... SELESAI")
}
