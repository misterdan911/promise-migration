package sidapet

import (
	"context"
	"database/sql"
	"fmt"

	"github.com/jackc/pgx/v5"
	"log"
	"promise-migration/db"
	"promise-migration/internal/sidapet/helper"
	"promise-migration/internal/sidapet/model/rdomisilimodel"
	"promise-migration/internal/sidapet/model/rvreghismodel"
	"promise-migration/internal/sidapet/model/rvregmodel"
	"promise-migration/internal/sidapet/model/trxjawabprofilmodel"
	"promise-migration/internal/sidapet/model/usermodel"
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
      id_profil_penyedia,
      id_user,
      id_jenis_penyedia,
      id_paket,
      nama,
      path_ktp,
      id_domisili,
      path_domisili,
      id_cabang_ut,
      alamat,
      no_telp,
      no_fax,
      email,
      nm_bank,
      pemilik_rek,
      kode_bank,
      no_rek,
      path_rek,
      npwp,
      path_npwp,
      lap_uang_perus,
      path_lap_perus,
      path_ikut_serta,
      path_kuasa,
      path_skb,
      path_skpp23,
      path_pph_dibebaskan,
      contact_person,
      p_status,
      klarifikasi,
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

		// Store Domisili in an Associative array
		mapDomisili := rdomisilimodel.GetMapDomisili()

		// var item JawabItem
		mapJawabItem := make(map[string]structs.JawabItem)

		// default untuk jenis_vendor 'perusahaan'
		mapJawabItem["pakta_integritas"] = structs.JawabItem{KodeItem: 1, Isian: "1"}
		mapJawabItem["nama_badan_usaha"] = structs.JawabItem{KodeItem: 2, Isian: profilePenyedia.Nama.String}
		mapJawabItem["domisili"] = structs.JawabItem{KodeItem: 3, Isian: mapDomisili[profilePenyedia.IdDomisili.Int32]}
		mapJawabItem["alamat"] = structs.JawabItem{KodeItem: 4, Isian: profilePenyedia.Alamat.String}
		mapJawabItem["no_telp"] = structs.JawabItem{KodeItem: 6, Isian: profilePenyedia.NoTelp.String}
		mapJawabItem["no_fax"] = structs.JawabItem{KodeItem: 7, Isian: profilePenyedia.NoFax.String}
		mapJawabItem["nm_bank"] = structs.JawabItem{KodeItem: 8, Isian: profilePenyedia.NmBank.String}
		mapJawabItem["pemilik_rek"] = structs.JawabItem{KodeItem: 10, Isian: profilePenyedia.PemilikRek.String}
		mapJawabItem["no_rek"] = structs.JawabItem{KodeItem: 11, Isian: profilePenyedia.NoRek.String}
		mapJawabItem["path_rek"] = structs.JawabItem{KodeItem: 12, Isian: profilePenyedia.PathRek.String}
		mapJawabItem["npwp"] = structs.JawabItem{KodeItem: 29, Isian: profilePenyedia.Npwp.String}
		mapJawabItem["path_npwp"] = structs.JawabItem{KodeItem: 30, Isian: profilePenyedia.PathNpwp.String}
		mapJawabItem["lap_uang_perus"] = structs.JawabItem{KodeItem: 46, Isian: profilePenyedia.LapUangPerus.String}
		mapJawabItem["path_lap_perus"] = structs.JawabItem{KodeItem: 47, Isian: profilePenyedia.PathLapPerus.String}
		mapJawabItem["path_ikut_serta"] = structs.JawabItem{KodeItem: 13, Isian: profilePenyedia.PathIkutSerta.String}
		mapJawabItem["path_kuasa"] = structs.JawabItem{KodeItem: 14, Isian: profilePenyedia.PathKuasa.String}
		mapJawabItem["path_skb"] = structs.JawabItem{KodeItem: 34, Isian: profilePenyedia.PathSkb.String}
		mapJawabItem["path_skpp23"] = structs.JawabItem{KodeItem: 38, Isian: profilePenyedia.PathSkpp23.String}

		item := structs.JawabItem{}

		if profilePenyedia.IdJenisPenyedia.Int32 == 2 {
			item = mapJawabItem["pakta_integritas"]
			item.KodeItem = 51
			mapJawabItem["pakta_integritas"] = item
      
			item = mapJawabItem["nama_badan_usaha"]
			item.KodeItem = 52
			mapJawabItem["nama_badan_usaha"] = item
      
			item = mapJawabItem["domisili"]
			item.KodeItem = 53
			mapJawabItem["domisili"] = item
      
			item = mapJawabItem["alamat"]
			item.KodeItem = 54
			mapJawabItem["alamat"] = item
			
      item = mapJawabItem["no_telp"]
			item.KodeItem = 56
			mapJawabItem["no_telp"] = item
			
      item = mapJawabItem["email"]
			item.KodeItem = 57
			mapJawabItem["email"] = item
			
      item = mapJawabItem["nm_bank"]
			item.KodeItem = 58
			mapJawabItem["nm_bank"] = item
			
      item = mapJawabItem["pemilik_rek"]
			item.KodeItem = 59
			mapJawabItem["pemilik_rek"] = item
			
      item = mapJawabItem["no_rek"]
			item.KodeItem = 60
			mapJawabItem["no_rek"] = item
			
      item = mapJawabItem["path_rek"]
			item.KodeItem = 61
			mapJawabItem["path_rek"] = item
			
      item = mapJawabItem["npwp"]
			item.KodeItem = 64
			mapJawabItem["npwp"] = item
			
      item = mapJawabItem["path_npwp"]
			item.KodeItem = 65
			mapJawabItem["path_npwp"] = item
			
      item = mapJawabItem["path_skb"]
			item.KodeItem = 73
			mapJawabItem["path_skb"] = item
			
      item = mapJawabItem["path_skpp23"]
			item.KodeItem = 77
			mapJawabItem["path_skpp23"] = item
		}

		trxjawabprofilmodel.InsertTrxJawabProfil(profilePenyedia, mapJawabItem)

	}
}
