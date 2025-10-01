package sibelahelper

import (
	"promise-migration/internal/g"
	"promise-migration/internal/model/dbsibela/refpermintaanmodel"

	"slices"
)

func TruncateTableAndLog() {
	// hapus data di tabel db.sibela.ref_permintaan tapi hanya yg ucr nya tidak terdaftar di daftar email excluded
	allRefPermintaan := refpermintaanmodel.GetAllData()

	for _, refPermintaan := range allRefPermintaan {
		skipUser := slices.Contains(g.ExcludedEmails, refPermintaan.Ucr.String)
		if skipUser {
			continue
		} else {
			refpermintaanmodel.DeleteByKodePermintaan(refPermintaan.KodePermintaan)
		}
	}

	refpermintaanmodel.DeleteWhereUcrNull()

	UpdatePkSequenceFromFile()
}
