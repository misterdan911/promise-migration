package sidapethelper

import (
	"context"
	"log"
	"promise-migration/db"
	"promise-migration/internal/g"
	"promise-migration/internal/ghelper"
	"promise-migration/internal/model/dbsidapet/refvendormodel"
	"promise-migration/internal/model/dbsidapet/refvendorregistermodel"
	"promise-migration/internal/sidapet/model/sidapet/trxpenjaringanmodel"
	"slices"
)

func TruncateTableAndLog() {

	// cek email user di tabel ref_user_register dengan daftar email yg di exclude
	// kalau email terdaftar di exclude, jangan lakukan apa2
	// kalau tidak terdaftar, hapus data di ref_vendor sehingga akan mentrigger FK ON DELETE CASCADE yang akan menghapus data di tabel lain yang berhungan dg ref_vendor
	allRefVendorRegister := refvendorregistermodel.GetAllData()

	for _, refVendorRegister := range allRefVendorRegister {
		skipUser := slices.Contains(g.ExcludedEmails, refVendorRegister.Email.String)
		if skipUser {
			continue
		} else {
			refvendormodel.DeleteByKodeVendor(refVendorRegister.KodeVendor)
		}
	}

	// Hapus semua data di tabel db_sidapet.trx_penjaringan kecuali yg ucr nya terdaftar di daftar email excluded
	allTrxPenjaringan := trxpenjaringanmodel.GetAllData()

	for _, trxPenjaringan := range allTrxPenjaringan {
		skipUser := slices.Contains(g.ExcludedEmails, trxPenjaringan.Ucr.String)
		if skipUser {
			continue
		} else {
			trxpenjaringanmodel.DeleteByKodePenjaringan(trxPenjaringan.KodePenjaringan)
		}
	}

	trxpenjaringanmodel.DeleteWhereUcrNull()

	UpdatePkSequenceFromFile()

	/*
	  TruncateTable("ref_vendor")
	*/

	// Truncate Log File
	ghelper.TruncateLog("pengalaman_bu.txt")
}

func TruncateTableAndLog2() {

	ctx := context.Background()

	qTruncate := "TRUNCATE TABLE ref_vendor CASCADE"
	_, err := db.DbSidapet.Exec(ctx, qTruncate)
	if err != nil {
		log.Fatal("Truncate ref_vendor Failed, " + err.Error())
	}


	qTruncate = "DELETE FROM trx_penjaringan"
	_, err = db.DbSidapet.Exec(ctx, qTruncate)
	if err != nil {
		log.Fatal("DELETE trx_penjaringan Failed, " + err.Error())
	}

	UpdatePkSequenceFromFile()
}
