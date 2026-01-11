package sibelahelper

import (
	"promise-migration/db"
	// "promise-migration/internal/g"
	// "promise-migration/internal/model/dbsibela/refpermintaanmodel"

	"context"
	"log"
	// "slices"
	// "strings"
)

/*
func TruncateTableAndLog() {

	// hapus data di tabel db.sibela.ref_permintaan tapi hanya yg ucr nya tidak terdaftar di daftar email excluded
	allRefPermintaan := refpermintaanmodel.GetAllData()

	for _, refPermintaan := range allRefPermintaan {
		ucrPart := strings.Split(refPermintaan.Ucr.String, "|")
		skipUser := slices.Contains(g.ExcludedEmails, ucrPart[0])
		if skipUser {
			continue
		} else {
			refpermintaanmodel.DeleteByKodePermintaan(refPermintaan.KodePermintaan)
		}
	}
	// ----------------------

	refpermintaanmodel.DeleteWhereUcrNull()

	UpdatePrimaryKeySequenceFromFile()
}
*/

func TruncateTableAndLog2() {

	ctx := context.Background()

	qTruncate := "TRUNCATE TABLE ref_permintaan CASCADE"
	_, err := db.DbSibela.Exec(ctx, qTruncate)
	if err != nil {
		log.Fatal("Truncate ref_permintaan Failedddd, " + err.Error())
	}

	// Delete akses penyedia ke sibela
	qDeleteSibelaAccess := "DELETE FROM trx_group_user WHERE kode_group = 'G04.3'"
	_, err2 := db.DbUsman.Exec(ctx, qDeleteSibelaAccess)
	if err2 != nil {
		log.Fatal("qDeleteSibelaAccess Failed, " + err2.Error())
	}

	// Delete data di E-Sign
	qDeleteEsign := "DELETE FROM trx_penandatangan WHERE nama_aplikasi = 'Si-BeLa'"
	_, err3 := db.DbEsign.Exec(ctx, qDeleteEsign)
	if err3 != nil {
		log.Fatal("qDeleteEsign Failed, " + err3.Error())
	}

	qTruncate = "TRUNCATE TABLE ref_dok_detail_transaksi CASCADE"
	_, err = db.DbSibela.Exec(ctx, qTruncate)
	if err != nil {
		log.Fatal("Truncate ref_dok_detail_transaksi Failedddd, " + err.Error())
	}

	
	UpdatePrimaryKeySequenceFromFile()
	UpdateEsignSequence()
}

func UpdateEsignSequence() {

	ctx := context.Background()
	
	qResetSeq := `
	select setval('trx_penandatangan_kode_trx_penandatangan_seq', (
	SELECT 
			CASE 
					WHEN MAX(kode_trx_penandatangan) IS NULL THEN 1
					ELSE MAX(kode_trx_penandatangan) + 1
			END
			AS next_id
	 from trx_penandatangan
	), false);
	select setval('trx_detail_penandatangan_kode_detail_penandatangan_seq', (
	SELECT 
			CASE 
					WHEN MAX(kode_detail_penandatangan) IS NULL THEN 1
					ELSE MAX(kode_detail_penandatangan) + 1
			END
			AS next_id
	 from trx_detail_penandatangan
	), false);
	`
	_, err3 := db.DbEsign.Exec(ctx, qResetSeq)
	if err3 != nil {
		log.Fatal("qResetSeq Failed, " + err3.Error())
	}

}
