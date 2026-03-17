package sidapet

import (
	"fmt"
	// "promise-migration/internal/structs"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/model/dbsidapet/refvendormodel"
	"promise-migration/internal/model/vmsdb/tblpaketmodel"
	"promise-migration/internal/model/vmsdb/tblprofilepenyediamodel"
	"promise-migration/internal/model/vmsdb/tblverifmodel"
	"promise-migration/internal/sidapet/model/sidapet/trxpenjaringanmodel"
	"promise-migration/internal/sidapet/model/sidapet/trxnilaiakhirmodel"
	"promise-migration/internal/sidapet/model/sidapet/trxvendorpenjrmodel"
	"promise-migration/internal/sidapet/model/sidapet/trxverifikatorpenjrmodel"


	"promise-migration/internal/model/dbsidapet/helperdokumenmodel"	

	"promise-migration/internal/sidapet/sidapethelper"
	"strings"
	"time"

	"github.com/jackc/pgx/v5/pgtype"
)

func MigrateTblPaket() {

	allVmsPaket := tblpaketmodel.GetAllData()

	// loop semua data vms_db.tbl_paket
	for _, vmsPaket := range allVmsPaket {

		// mode: quicktest
		// -----------------------------------------------------------------
		// if vmsPaket.IdPaket.Int32 != 9 {
		// 	continue
		// }


		var statusPersetujuan pgtype.Text
		if vmsPaket.Status.Int32 == 1 {
			statusPersetujuan.Valid = true
			statusPersetujuan.String = "tolak"
		}
		if vmsPaket.Status.Int32 == 2 {
			statusPersetujuan.Valid = true
			statusPersetujuan.String = "terima"
		}

		var statusProsesPjr pgtype.Text
		var statusPengumumanDpt pgtype.Text
		paketTime := vmsPaket.TglUmumPaket.Time    // Get the time value from pgtype.Timestamptz
		now := time.Now().In(paketTime.Location()) // Get current time in the same location as paketTime
		if now.After(paketTime) {
			statusProsesPjr.Valid = true
			statusProsesPjr.String = "selesai"
			statusPengumumanDpt.Valid = true
			statusPengumumanDpt.String = "selesai"
		}

		kodeUnitPbj := pgtype.Text{Valid: true, String: "UN31.DMAUPBJ"}

		kodeStatusPenjaringan := GetKodeStatusPenjaringan(vmsPaket)

		metode := pgtype.Text{Valid: true, String: strings.ToLower(vmsPaket.Metode.String)}

	  helperDokumen := helperdokumenmodel.GetByOriginalPath(vmsPaket.PathPaket)
	  // filePersyaratan := helperDokumen.Newfilename
	  // encryptKeySkb := helperDokumen.EncryptKey


		trxPenjaringan := trxpenjaringanmodel.TrxPenjaringan{
			NamaPenjaringan:     vmsPaket.NamaPaket,
			Metode:              metode,
			FilePersyaratan:     helperDokumen.Newfilename,
			KeypassFilePersyaratan:     helperDokumen.EncryptKey,
			KodeStatusPengajuan: pgtype.Int4{Valid: true, Int32: 5},
			StatusPersetujuan:   statusPersetujuan,
			StatusPengajuanPjr:  pgtype.Text{Valid: true, String: "selesai"},
			StatusProsesPjr:     statusProsesPjr,
			StatusPengumumanDpt: statusPengumumanDpt,
			TglDaftarAwal:       vmsPaket.TglDaftarAwal,
			TglDaftarAkhir:      vmsPaket.TglDaftarAkhir,
			TglEvaluasiAwal:     vmsPaket.TglEvalAwal,
			TglEvaluasiAkhir:    vmsPaket.TglEvalAkhir,
			TglPengumuman:       vmsPaket.TglUmumPaket,
			KodeUnitPbj:         kodeUnitPbj,
			Ucr:                 pgtype.Text{Valid: true, String: "adrian@ecampus.ut.ac.id"},
			Udcr:                vmsPaket.CreatedAt,
			Udch:                vmsPaket.CreatedAt,
			KodeStatusPenjaringan: kodeStatusPenjaringan,
		}

		kodePenjaringan := trxpenjaringanmodel.InsertTrxPenjaringan(trxPenjaringan)
		trxverifikatorpenjrmodel.InsertTrxVerifikatorPenjr(kodePenjaringan, vmsPaket)
		MigrateTblPaketUndang(vmsPaket, kodePenjaringan)



		// dari tabel tbl_verif dapatkan semua id_profile untuk id_paket == vmsPaket.IdPaket
		allTblVerif := tblverifmodel.GetDataByIdPaket(vmsPaket.IdPaket)

    for _, tblVerif := range allTblVerif {
      // dapatkan id_user
      tblProfilePenyedia := tblprofilepenyediamodel.GetDataByIdProfile(tblVerif.IdProfil)

      // // kalo data profilenya kosong, kemungkinan sudah dihapus, jadi skip aja
      // if (tblProfilePenyedia == structs.TblProfilePenyedia{}) {
      // 	continue
      // }

      // dapatkan kode_vendor
      helperUser := helperusermodel.GetByVmsUserId(tblProfilePenyedia.IdUser)

      // kalau user tidak punya kode_vendor, skip, berarti datanya sudah dihapus di vms_db
      if (helperUser.KodeVendor == pgtype.Int4{}) {
      	continue
      }

      // dapatkan kodeJenisVendor
      fmt.Printf("helperUser.KodeVendor: %d\n", helperUser.KodeVendor.Int32)
      refVendor := refvendormodel.GetDataByKodeVendor(helperUser.KodeVendor)

			// mode: quicktest
			// ini dipake pas testing InsertIntoCustomTable
      // if (refVendor.KodeVendor == pgtype.Int4{}) {
      // 	continue
      // }

      // insert ke trx_vendor_penjr
			statusVerifikasi := pgtype.Text{Valid:true, String: ""}
			if (tblVerif.StatusVerif.Int32 == 4) && (tblVerif.Terpilih.Int32 == 1) {
				statusVerifikasi.String = "diterima"
			} else {
				statusVerifikasi.String = "ditolak"
			}

			statusDpt := pgtype.Text{Valid:true, String: ""}
			if refVendor.IsTetap.Bool == true {
				statusDpt.String = "terpilih"
			} else {
				statusDpt.String = "tidak_terpilih"
			}

		  trxVendorPenjr := trxvendorpenjrmodel.TrxVendorPenjr {
		    KodePenjaringan: kodePenjaringan,
		    KodeVendor: refVendor.KodeVendor,
				StatusDpt: statusDpt,
		  }

		  kodeVendorPenjr := trxvendorpenjrmodel.InsertNew(trxVendorPenjr)

			InsertIntoCustomTable(kodePenjaringan, refVendor.KodeVendor)

			fmt.Printf("kodeVendor: %d\n", refVendor.KodeVendor.Int32)

		  // Insert trx_nilai_akhir
			trxnilaiakhirmodel.InsertTrxNilaiakhir(refVendor.KodeJenisVendor, kodeVendorPenjr, tblVerif)


      // trxvendorpenjrmodel.InsertTrxVendorPenjr(tblVerif, refVendor.KodeJenisVendor)
    }

	}

	sidapethelper.UpdatePkSequence("trx_penjaringan", "kode_penjaringan")

	fmt.Println("Migrating tbl_paket... SELESAI")
}

func GetKodeStatusPenjaringan(tblPaket tblpaketmodel.TblPaket) pgtype.Int4 {

	var kodeStatusPenjaringan pgtype.Int4
	kodeStatusPenjaringan.Valid = true

	// Get current timestamp for comparison
	currentTimestamptz := pgtype.Timestamptz{
			Time:   time.Now().UTC(),
			Valid: true,
	}

	if currentTimestamptz.Time.After(tblPaket.TglUmumPaket.Time) {
		kodeStatusPenjaringan.Int32 = 15
	} else if currentTimestamptz.Time.After(tblPaket.TglEvalAkhir.Time) {
		kodeStatusPenjaringan.Int32 = 13
	} else if currentTimestamptz.Time.After(tblPaket.TglEvalAwal.Time) {
		kodeStatusPenjaringan.Int32 = 12
	} else if currentTimestamptz.Time.After(tblPaket.TglDaftarAwal.Time) {
		kodeStatusPenjaringan.Int32 = 11
	}

	 return kodeStatusPenjaringan
}
