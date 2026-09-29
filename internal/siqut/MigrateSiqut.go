package siqut

import (
	// "fmt"
	"promise-migration/internal/model/dbsidapet/helperdokumenmodel"
	"promise-migration/internal/model/dbsiqut/bridgingkoderupmodel"
	"promise-migration/internal/model/dbsiqut/bridgingusermodel"
	"promise-migration/internal/model/dbsiqut/refperencanaanmodel"
	"promise-migration/internal/model/dbsiqut/trxdokumenmodel"
	"promise-migration/internal/model/dbsiqut/trxkajiulangmodel"
	"promise-migration/internal/model/dbsiqut/trxpersiapanpemilihanmodel"
	"promise-migration/internal/model/dbsiqut/trxpokjaterpilihmodel"
	"promise-migration/internal/model/promise_siqut/helperdpppokjamodel"
	"promise-migration/internal/model/promise_siqut/tblsiqutdppmodel"

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

		InsertDokumenFromTblSiqutDpp(tblSiqut, refPerencanaan)

		trxKajiUlang := trxkajiulangmodel.TrxKajiUlang{
			KodePerencanaan: refPerencanaan.KodePerencanaan,
		}
		trxKajiUlang = trxkajiulangmodel.InsertNew(trxKajiUlang)

		kodeMetodePemasukanDok := pgtype.Int4{Valid: false}
		if tblSiqut.MetodePemasukan.String == "Metode satu file" {
			kodeMetodePemasukanDok = pgtype.Int4{Valid: true, Int32: 1}
		}

		kodeMetodeEvaluasi := pgtype.Int4{Valid: false}
		switch tblSiqut.MetodeEvaluasi.String {
		case "Harga Terendah":
			kodeMetodeEvaluasi = pgtype.Int4{Valid: true, Int32: 1}
		case "Sistem Nilai":
			kodeMetodeEvaluasi = pgtype.Int4{Valid: true, Int32: 2}
		}

		trxPersiapanPemilihan := trxpersiapanpemilihanmodel.TrxPersiapanPemilihan{
			KodeKu: trxKajiUlang.KodeKu,
			KodeMetodePemasukanDok: kodeMetodePemasukanDok,
			KodeMetodeEvaluasi: kodeMetodeEvaluasi,
		}
		trxPersiapanPemilihan = trxpersiapanpemilihanmodel.InsertNew(trxPersiapanPemilihan)

		allHelperDppPokja := helperdpppokjamodel.GetPokjaTerpilih(tblSiqut.IdSiqutDpp)

		for _, helperDppPokja := range allHelperDppPokja {
			// fmt.Printf("helperDppPokja: %d\n", helperDppPokja.IdPokja.Int32)

			trxPokjaTerpilih := trxpokjaterpilihmodel.TrxPokjaTerpilih{
				KodePerencanaan: tblSiqut.IdSiqutDpp,
				Id: helperDppPokja.UserIdV2,
				NamaPokja: helperDppPokja.Name,
				Nip: helperDppPokja.Nip,
				Email: helperDppPokja.EmailReal,
			}
			_ = trxpokjaterpilihmodel.InsertNew(trxPokjaTerpilih)
		}

  }

	refperencanaanmodel.UpdateSequence()
}

func InsertDokumenFromTblSiqutDpp(tblSiqut tblsiqutdppmodel.TblSiqutDpp, refPerencanaan refperencanaanmodel.RefPerencanaan) {
	paths := []pgtype.Text{
		tblSiqut.PathRancanganKontrak,
		tblSiqut.PathKak,
		tblSiqut.PathSpek,
		tblSiqut.PathQuotation,
		tblSiqut.PathDokBa,
		tblSiqut.PathDokAddendum,
	}

	for _, path := range paths {

		if !path.Valid || path.String == "" {
			continue
		}

		kodeKelDok := pgtype.Int4{Valid: false}

		if path == tblSiqut.PathRancanganKontrak {
			kodeKelDok.Valid = true
			kodeKelDok.Int32 = 3
		} else if path == tblSiqut.PathKak {
			kodeKelDok.Valid = true
			kodeKelDok.Int32 = 1
		} else if path == tblSiqut.PathSpek {
			kodeKelDok.Valid = true
			kodeKelDok.Int32 = 1
		} else if path == tblSiqut.PathQuotation {
			kodeKelDok.Valid = true
			kodeKelDok.Int32 = 7
		} else if path == tblSiqut.PathDokBa {
			kodeKelDok.Valid = true
			kodeKelDok.Int32 = 9
		} else if path == tblSiqut.PathDokAddendum {
			kodeKelDok.Valid = true
			kodeKelDok.Int32 = 10
		}

		helperDokumen := helperdokumenmodel.GetByOriginalPath(path)
		if !helperDokumen.Newfilename.Valid { continue }
		trxdokumenmodel.InsertNew(trxdokumenmodel.TrxDokumen{
			KodePerencanaan: refPerencanaan.KodePerencanaan,
			FileDok:         helperDokumen.Newfilename,
			EncryptKey:      helperDokumen.EncryptKey,
			KodeKelDok:      kodeKelDok,
			Udcr:            tblSiqut.CreatedAt,
		})
	}
}

