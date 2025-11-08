package sibelahelper

import (
	"promise-migration/db"
	"promise-migration/internal/g"
	"promise-migration/internal/model/dbsibela/refpermintaanmodel"

	"context"
	"log"
	"slices"
	"strings"
)

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


func TruncateTableAndLog2() {

	ctx := context.Background()

	qTruncate := "TRUNCATE TABLE ref_permintaan CASCADE"
	_, err := db.DbSibela.Exec(ctx, qTruncate)
	if err != nil {
		log.Fatal("Truncate ref_permintaan Failed, " + err.Error())
	}

	UpdatePrimaryKeySequenceFromFile()
}
