package siplanghelper

import (
	"promise-migration/db"
	// "promise-migration/internal/g"
	// "promise-migration/internal/model/dbsiplang/refpermintaanmodel"

	"context"
	"log"
	// "slices"
	// "strings"
)

func TruncateTableAndLog2() {

	ctx := context.Background()

	qTruncate := "TRUNCATE TABLE ref_permintaan CASCADE"
	_, err := db.DbSiplang.Exec(ctx, qTruncate)
	if err != nil {
		log.Fatal("Truncate ref_permintaan Failedddd, " + err.Error())
	}

	// Delete akses penyedia di Usman
	qDeleteSiplangAccess := "DELETE FROM trx_group_user WHERE kode_group = 'G05.3'"
	_, err2 := db.DbUsman.Exec(ctx, qDeleteSiplangAccess)
	if err2 != nil {
		log.Fatal("qDeleteSiplangAccess Failed, " + err2.Error())
	}

	// Delete data di E-Sign
	/*
	qDeleteEsign := "DELETE FROM trx_penandatangan WHERE nama_aplikasi = 'Si-PLang'"
	_, err3 := db.DbEsign.Exec(ctx, qDeleteEsign)
	if err3 != nil {
		log.Fatal("qDeleteEsign Failed, " + err3.Error())
	}

	qTruncate = "TRUNCATE TABLE ref_dok_detail_transaksi CASCADE"
	_, err = db.DbSiplang.Exec(ctx, qTruncate)
	if err != nil {
		log.Fatal("Truncate ref_dok_detail_transaksi Failedddd, " + err.Error())
	}
	*/

	UpdatePrimaryKeySequenceFromFile()
	UpdateUsmanSequence()
	// UpdateEsignSequence()
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

func UpdateUsmanSequence() {

	ctx := context.Background()

	qResetSeq := `
	select setval('trx_group_user_id_seq', (
	SELECT 
			CASE 
					WHEN MAX(id_group_user) IS NULL THEN 1
					ELSE MAX(id_group_user) + 1
			END
			AS next_id
	 from trx_group_user
	), false);
	`
	_, err3 := db.DbUsman.Exec(ctx, qResetSeq)
	if err3 != nil {
		log.Fatal("qResetSeq Failed, " + err3.Error())
	}

}
