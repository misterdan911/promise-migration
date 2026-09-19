package siqut

import (
  // "fmt"
  "promise-migration/internal/model/promise_siqut/tblsiqutdppmodel"
  "promise-migration/internal/model/dbsiqut/refperencanaanmodel"
  "promise-migration/internal/model/dbsiqut/bridgingkoderupmodel"
  "promise-migration/internal/model/dbsiqut/bridgingusermodel"
  "promise-migration/internal/model/dbsiqut/trxkajiulangmodel"
  "promise-migration/internal/model/dbsiqut/trxpersiapanpemilihanmodel"

	"github.com/jackc/pgx/v5/pgtype"
)

func MigrateSiqut() {

  allTblSiqutDpp := tblsiqutdppmodel.GetAllData()

	arrJenisPengadaan := map[string]int32{
		"Barang":           1,
		"Konstruksi":       2,
		"Jasa Konsultansi": 3,
		"Jasa Lainnya":     4,
	}

	arrJenisKontrak := map[string]int32{
		"Kontrak Lumsum":                 1,
		"Kontrak Harga Satuan":           2,
		"Kontrak Payung (e-katalog)":     6,
		"Kontrak Pekerjaan Terintegrasi": 1,
	}

  for _, tblSiqut := range allTblSiqutDpp {
    // fmt.Printf("Kode unit: %s\n", tblSiqut.KodeUnit.String)
		
		kodeRup := bridgingkoderupmodel.GetKodeRup(tblSiqut.IdRup)
		ucr := bridgingusermodel.GetNama(tblSiqut.IdPpk)
		kodeJenisPengadaan := pgtype.Int4{Valid: true, Int32: arrJenisPengadaan[tblSiqut.JenisKriteria.String]}
		kodeJenisKontrak := pgtype.Int4{Valid: true, Int32: arrJenisKontrak[tblSiqut.JenisKontrak.String]}
		
    refPerencanaan := refperencanaanmodel.RefPerencanaan{
      KodePerencanaan: tblSiqut.IdSiqutDpp,
      KodeRup: kodeRup,
      KodeUnit: tblSiqut.KodeUnit,
      Ucr: ucr,
      NamaPaket: tblSiqut.Paket,
      KodeJenisPengadaan: kodeJenisPengadaan,
      NilaiHps: tblSiqut.NilaiHps,
			KodeJenisKontrak: kodeJenisKontrak,
			Udcr: tblSiqut.CreatedAt,
			Udch: tblSiqut.UpdatedAt,
    }

    _ = refperencanaanmodel.InsertNew(refPerencanaan)

		trxKajiUlang := trxkajiulangmodel.TrxKajiUlang{
			KodePerencanaan: refPerencanaan.KodePerencanaan,
		}
		trxKajiUlang = trxkajiulangmodel.InsertNew(trxKajiUlang)

		kodeMetodePemasukanDok := pgtype.Int4{Valid: false}
		if tblSiqut.MetodePemasukan.String == "Metode satu file" {
			kodeMetodePemasukanDok = pgtype.Int4{Valid: true, Int32: 1}
		}

		kodeMetodeEvaluasi := pgtype.Int4{Valid: false}
		if tblSiqut.MetodeEvaluasi.String == "Harga Terendah" {
			kodeMetodeEvaluasi = pgtype.Int4{Valid: true, Int32: 1}
		} else if tblSiqut.MetodeEvaluasi.String == "Sistem Nilai" {
			kodeMetodeEvaluasi = pgtype.Int4{Valid: true, Int32: 2}
		}
		
		trxPersiapanPemilihan := trxpersiapanpemilihanmodel.TrxPersiapanPemilihan{
			KodeKu: trxKajiUlang.KodeKu,
			KodeMetodePemasukanDok: kodeMetodePemasukanDok,
			KodeMetodeEvaluasi: kodeMetodeEvaluasi,
		}
		trxPersiapanPemilihan = trxpersiapanpemilihanmodel.InsertNew(trxPersiapanPemilihan)
  }

	refperencanaanmodel.UpdateSequence()
}
