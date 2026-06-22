package siqut

import (
  // "fmt"
  "promise-migration/internal/model/promise_siqut/tblsiqutdppmodel"
  "promise-migration/internal/model/dbsiqut/refperencanaanmodel"
  "promise-migration/internal/model/dbsiqut/bridgingkoderupmodel"
)

func MigrateSiqut() {

  allTblSiqutDpp := tblsiqutdppmodel.GetAllData()

  for _, tblSiqut := range allTblSiqutDpp {
    // fmt.Printf("Kode unit: %s\n", tblSiqut.KodeUnit.String)
		
		// kode_rup
		kodeRup := bridgingkoderupmodel.GetKodeRup(tblSiqut.IdRup)

    refPerencanaan := refperencanaanmodel.RefPerencanaan{
      KodePerencanaan: tblSiqut.IdSiqutDpp,
      KodeRup: kodeRup,
      KodeUnit: tblSiqut.KodeUnit,
    }

    _ = refperencanaanmodel.InsertNew(refPerencanaan)
  }

	refperencanaanmodel.UpdateSequence()
}
