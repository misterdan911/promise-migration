package sidapet

import (
	"context"
	"database/sql"
	"fmt"

	"github.com/jackc/pgx/v5"
	"log"
	"promise-migration/db"
	"promise-migration/internal/sidapet/helper"
	"promise-migration/internal/sidapet/model/rvreghismodel"
	"promise-migration/internal/sidapet/model/rvregmodel"
	"promise-migration/internal/sidapet/model/usermodel"
	"promise-migration/internal/sidapet/model/trxjawabprofilmodel"
	"promise-migration/internal/sidapet/structs"
)

type JawabItem struct {
	KodeItem int
	Isian    string
}

func MigrateTblProfilePenyedia() {

	helper.TruncateTable("ref_vendor")
	helper.TruncateTable("ref_vendor_register")
	helper.TruncateTable("ref_vendor_reg_history")
	helper.TruncateTable("trx_jawab_profil")

	ctx := context.Background()

	qTblProfilePenyedia := `
    SELECT
      email,
      id_user,
      id_profil_penyedia,
      id_jenis_penyedia,
      nama,
      penyedia_terpilih,
      create_time,
      update_time
    FROM tbl_profile_penyedia
    ORDER BY id_profil_penyedia ASC`

	rwTblProfilePenyedia, err := db.VmsDb.Query(ctx, qTblProfilePenyedia)
	if err != nil {
		log.Fatal("qTblProfilePenyedia Failed, " + err.Error() + " " + qTblProfilePenyedia)
	}

	allProfilePenyedia, err := pgx.CollectRows(rwTblProfilePenyedia, pgx.RowToStructByName[structs.TblProfilePenyedia])
	if err != nil {
		log.Fatal("failed collecting rwTblProfilePenyedia, " + err.Error())
	}
	defer rwTblProfilePenyedia.Close()

	for _, profilePenyedia := range allProfilePenyedia {

		// Cek dulu apakah profilePenyedia.IdUser nya kosong
		// if profilePenyedia.IdUser.Valid == false {
		// 	log.Fatal("profilePenyedia.IdUser is NULL")
		// }
		//

		user := usermodel.GetUserById(profilePenyedia.IdUser)
		if user == (structs.User{}) {
			continue
		}

		qInsRefVendor := `
		INSERT INTO ref_vendor (
		  kode_vendor, 
		  kode_jenis_vendor, 
		  nama_perusahaan, 
		  is_tetap,
		  udcr,
		  udch
		) VALUES (
		  @kode_vendor,
		  @kode_jenis_vendor,
		  @nama_perusahaan,
		  @is_tetap,
		  @udcr,
		  @udch
		)`

		isTetap := sql.NullBool{Valid: true}
		if profilePenyedia.PenyediaTerpilih.Int32 == 99 {
			isTetap.Bool = false
		} else {
			isTetap.Bool = true
		}

		args := pgx.NamedArgs{
			"kode_vendor":       profilePenyedia.IdProfilPenyedia,
			"kode_jenis_vendor": profilePenyedia.IdJenisPenyedia,
			"nama_perusahaan":   profilePenyedia.Nama,
			"is_tetap":          isTetap,
			"udcr":              profilePenyedia.CreateTime,
			"udch":              profilePenyedia.UpdateTime,
		}
		_, errInsRefVendor := db.DbSidapet.Exec(ctx, qInsRefVendor, args)
		if errInsRefVendor != nil {
			fmt.Println("unable to insert ref_vendor, " + errInsRefVendor.Error())
		}

		// Insert to ref_vendor_register
		kodeRegister := rvregmodel.InsertRefVendorRegister(profilePenyedia, user)

		// Insert to ref_vendor_reg_history
		rvreghismodel.InsertRefVendorRegHistory(profilePenyedia, user, kodeRegister)

		// TODO: Store Domisili in an Associative array

		// var item JawabItem
		mapJawabItem := make(map[string]structs.JawabItem)

		// default untuk jenis_vendor 'perusahaan'
		mapJawabItem["pakta_integritas"] = structs.JawabItem{KodeItem: 1, Isian: "1"}
		mapJawabItem["nama_badan_usaha"] = structs.JawabItem{KodeItem: 2, Isian: profilePenyedia.Nama.String}

    trxjawabprofilmodel.InsertTrxJawabProfil(profilePenyedia, mapJawabItem)

		// fmt.Println(mapJawabItem["pakta_integritas"].Isian)
		//
		// item = mapJawabItem["pakta_integritas"]
		// item.Isian = "2"
		// mapJawabItem["pakta_integritas"] = item
		// fmt.Println(mapJawabItem["pakta_integritas"].Isian)
		//
		// item = mapJawabItem["pakta_integritas"]
		// item.Isian = "3"
		// mapJawabItem["pakta_integritas"] = item
		// fmt.Println(mapJawabItem["pakta_integritas"].Isian)
	}
}
