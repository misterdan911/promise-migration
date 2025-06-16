package sidapet

import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"time"

	"promise-migration/db"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/model/dbsidapet/refvendormodel"
	promisesibelaprofile "promise-migration/internal/model/promise_sibela/tblprofilepenyediamodel"
	vmsprofile "promise-migration/internal/model/vmsdb/tblprofilepenyediamodel"
	"promise-migration/internal/sidapet/model/radministrasiperomodel"
	"promise-migration/internal/sidapet/model/rdatadiriumummodel"
	"promise-migration/internal/sidapet/model/rpersonaliaperomodel"
	"promise-migration/internal/sidapet/model/rvreghismodel"
	"promise-migration/internal/sidapet/model/rvregmodel"
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
	"promise-migration/internal/sidapet/sidapethelper"
	"promise-migration/internal/usman/model/dbusman/refuserexternalmodel"
	"promise-migration/internal/usman/model/dbusman/trxgroupusermodel"
	"promise-migration/internal/structs"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"

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

	// _, errInsRefVendor := db.DbSidapet.Exec(ctx, qInsRefVendor, args)
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

	// masukan data ke tabel ref_user_external kalau helperUser external
	refUserExternal := refuserexternalmodel.RefUserExternal{
		Id:				helperUser.KodeVendor,
		IdUser:         helperUser.UsmanRefUserId,
		Username:       helperUser.NamaPenyedia,
		Nama:           helperUser.VmsUserName,
		StatusPengguna: helperUser.JenisPenyedia,
		Udcr:           helperUser.VmsUserCreatedAt,
		Udch:           helperUser.VmsUserUpdatedAt,
	}
	refuserexternalmodel.InsertNew(refUserExternal)

	// kasih akses masuk ke Si-Dapet
	// karena semua helperUser external pasti bisa masuk Si-Dapet
	// trxgroupusermodel.InsertNew(refUser, "G01.8")
	currentTime := time.Now().UTC()
	trxGroupUser := trxgroupusermodel.TrxGroupUser{
		KodeGroup: pgtype.Text{Valid: true, String: "G01.8"},
		IdUser: helperUser.UsmanRefUserId,
		Status: pgtype.Text{Valid: true, String: "1"},
		Udcr: pgtype.Text{Valid: true, String: currentTime.String()},
	}
	trxgroupusermodel.InsertNew(trxGroupUser)

	// Insert to ref_vendor_register
	kodeRegister := rvregmodel.InsertRefVendorRegister(profilePenyedia, helperUser)

	// Insert to ref_vendor_reg_history
	rvreghismodel.InsertRefVendorRegHistory(profilePenyedia, helperUser, kodeRegister)

	// Insert to ref_datadiri_umum
	rdatadiriumummodel.InsertRefDataDiriUmum(profilePenyedia, helperUser)

	radministrasiperomodel.InsertRefAdministrasiPero(profilePenyedia, helperUser)
	rpersonaliaperomodel.InsertRefPersonaliaPero(profilePenyedia, helperUser)
	rpengalamanperomodel.InsertRefPengalamanPero(profilePenyedia, helperUser)
	rsertifperomodel.InsertRefSertifPero(profilePenyedia, helperUser)
	rkeuanganpero.InsertRefKeuanganPero(profilePenyedia, helperUser)

	radmbumodel.InsertRefAdmBu(profilePenyedia, helperUser)
	rlanhukumbumodel.InsertRefLanHukumBu(profilePenyedia, helperUser)
	rpengurusbumodel.InsertRefPengurusBu(profilePenyedia, helperUser)
	rkomisarisbumodel.InsertRefKomisarisBu(profilePenyedia, helperUser)
	rdireksibumodel.InsertRefDireksiBu(profilePenyedia, helperUser)
	rizinusahabumodel.InsertRefIzinUsahaBu(profilePenyedia, helperUser)
	//rsertifikatusahabumodel.InsertrefSertifikatUsahaBu(profilePenyedia, helperUser)	// gak ada sertifikat di db lama
	rsahambumodel.InsertrefSahamBu(profilePenyedia, helperUser) // belum tau cara dapetin is_saham_selamanya
	rdatapajakbumodel.InsertrefDataPajakBu(profilePenyedia, helperUser)
	rtenagaahlibumodel.InsertPersonalia(profilePenyedia, helperUser)

	// data kantor tidak ada

	rfasilitasbumodel.InsertRefFasilitasBu(profilePenyedia, helperUser)
	rpengalamanbumodel.InsertPengalaman(profilePenyedia, helperUser)
	rkeuanganbumodel.InsertRefKeuanganBu(profilePenyedia, helperUser)

	// Update sequence
	sidapethelper.UpdatePkSequence("ref_vendor", "kode_vendor")
	sidapethelper.UpdatePkSequence("ref_vendor_register", "kode_register")
	sidapethelper.UpdatePkSequence("ref_vendor_reg_history", "kode_register")

}
