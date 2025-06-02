package sidapet

import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"promise-migration/db"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/model/dbsidapet/refvendormodel"
	promisesibelaprofile "promise-migration/internal/model/promise_sibela/tblprofilepenyediamodel"
	vmsprofile "promise-migration/internal/model/vmsdb/tblprofilepenyediamodel"
	"promise-migration/internal/sidapet/helper"
	"promise-migration/internal/sidapet/model/radministrasiperomodel"
	"promise-migration/internal/sidapet/model/rdatadiriumummodel"
	"promise-migration/internal/sidapet/model/rpersonaliaperomodel"
	"promise-migration/internal/sidapet/model/sidapet/radmbumodel"
	"promise-migration/internal/sidapet/model/sidapet/rdatapajakbumodel"
	"promise-migration/internal/sidapet/model/sidapet/rdireksibumodel"
	"promise-migration/internal/sidapet/model/sidapet/rfasilitasbumodel"
	"promise-migration/internal/sidapet/model/sidapet/rizinusahabumodel"
	"promise-migration/internal/sidapet/model/sidapet/rkeuanganbumodel"
	"promise-migration/internal/sidapet/model/sidapet/rkeuanganpero"
	"promise-migration/internal/sidapet/model/sidapet/rkomisarisbumodel"
	"promise-migration/internal/sidapet/model/sidapet/rlanhukumbumodel"
	"promise-migration/internal/sidapet/model/sidapet/rpengalamanbumodel"
	"promise-migration/internal/sidapet/model/sidapet/rpengalamanperomodel"
	"promise-migration/internal/sidapet/model/sidapet/rpengurusbumodel"
	"promise-migration/internal/sidapet/model/sidapet/rsahambumodel"
	"promise-migration/internal/sidapet/model/sidapet/rsertifperomodel"
	"promise-migration/internal/sidapet/model/sidapet/rtenagaahlibumodel"

	"promise-migration/internal/sidapet/model/rvreghismodel"
	"promise-migration/internal/sidapet/model/rvregmodel"
	"promise-migration/internal/structs"

	"github.com/jackc/pgx/v5"
)

type JawabItem struct {
	KodeItem int
	Isian    string
}

func MigrateTblProfilePenyedia(helperUser helperusermodel.HelperUser) {

	ctx := context.Background()

	var profilePenyedia structs.TblProfilePenyedia

	if helperUser.DbPenyedia.String == "vms_db" {
		profilePenyedia = vmsprofile.GetPenyediaByUserId(helperUser.VmsUserId)
	} else if helperUser.DbPenyedia.String == "promise_sibela" {
		profilePenyedia = promisesibelaprofile.GetPenyediaByUserId(helperUser.VmsUserId)
	} else {
		log.Fatal("Invalid DbPenyedia")
	}

	qInsRefVendor := `
		INSERT INTO ref_vendor (
		  kode_jenis_vendor, 
		  nama_perusahaan,
		  is_tetap,
		  udcr,
		  udch
		) VALUES (
		  @kode_jenis_vendor,
		  @nama_perusahaan,
		  @is_tetap,
		  @udcr,
		  @udch
		) RETURNING *`

	isTetap := sql.NullBool{Valid: true}
	if profilePenyedia.PenyediaTerpilih.Int32 == 99 {
		isTetap.Bool = false
	} else {
		isTetap.Bool = true
	}

	args := pgx.NamedArgs{
		"kode_jenis_vendor": profilePenyedia.IdJenisPenyedia,
		"nama_perusahaan":   profilePenyedia.Nama,
		"is_tetap":          isTetap,
		"udcr":              profilePenyedia.CreateTime,
		"udch":              profilePenyedia.UpdateTime,
	}
	_, errInsRefVendor := db.DbSidapet.Exec(ctx, qInsRefVendor, args)
	rwVendor, errInsRefVendor := db.DbSidapet.Query(ctx, qInsRefVendor, args)

	if errInsRefVendor != nil {
		fmt.Println("unable to insert ref_vendor, " + errInsRefVendor.Error())
	}

	allVendor, err2 := pgx.CollectRows(rwVendor, pgx.RowToStructByName[refvendormodel.RefVendor])
	if err2 != nil {
		log.Fatal("failed collecting rwVendor (tbl_profile_penyedia.go), " + err2.Error())
	}
	defer rwVendor.Close()

	helperUser.KodeVendor = allVendor[0].KodeVendor
	helperusermodel.UpdateKodeVendor(helperUser)

	// Insert to ref_vendor_register
	kodeRegister := rvregmodel.InsertRefVendorRegister(profilePenyedia, helperUser)

	// Insert to ref_vendor_reg_history
	rvreghismodel.InsertRefVendorRegHistory(profilePenyedia, helperUser, kodeRegister)

	// Insert to ref_datadiri_umum
	rdatadiriumummodel.InsertRefDataDiriUmum(profilePenyedia)

	radministrasiperomodel.InsertRefAdministrasiPero(profilePenyedia)
	rpersonaliaperomodel.InsertRefPersonaliaPero(profilePenyedia)
	rpengalamanperomodel.InsertRefPengalamanPero(profilePenyedia)
	rsertifperomodel.InsertRefSertifPero(profilePenyedia)
	rkeuanganpero.InsertRefKeuanganPero(profilePenyedia)

	radmbumodel.InsertRefAdmBu(profilePenyedia)
	rlanhukumbumodel.InsertRefLanHukumBu(profilePenyedia)
	rpengurusbumodel.InsertRefPengurusBu(profilePenyedia)
	rkomisarisbumodel.InsertRefKomisarisBu(profilePenyedia)
	rdireksibumodel.InsertRefDireksiBu(profilePenyedia)
	rizinusahabumodel.InsertRefIzinUsahaBu(profilePenyedia)
	//rsertifikatusahabumodel.InsertrefSertifikatUsahaBu(profilePenyedia)	// gak ada sertifikat di db lama
	rsahambumodel.InsertrefSahamBu(profilePenyedia) // belum tau cara dapetin is_saham_selamanya
	rdatapajakbumodel.InsertrefDataPajakBu(profilePenyedia)
	rtenagaahlibumodel.InsertPersonalia(profilePenyedia)

	// data kantor tidak ada

	rfasilitasbumodel.InsertRefFasilitasBu(profilePenyedia)
	rpengalamanbumodel.InsertPengalaman(profilePenyedia)
	rkeuanganbumodel.InsertRefKeuanganBu(profilePenyedia)

	// Update sequence
	helper.UpdatePkSequence("ref_vendor", "kode_vendor")
	helper.UpdatePkSequence("ref_vendor_register", "kode_register")
	helper.UpdatePkSequence("ref_vendor_reg_history", "kode_register")

}
