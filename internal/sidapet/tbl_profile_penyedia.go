package sidapet

import (
	"context"
	"database/sql"
	"fmt"
	"promise-migration/internal/sidapet/model/radministrasiperomodel"
	"promise-migration/internal/sidapet/model/rdatadiriumummodel"
	"promise-migration/internal/sidapet/model/rpersonaliaperomodel"
	"promise-migration/internal/sidapet/model/rvreghismodel"
	"promise-migration/internal/sidapet/model/rvregmodel"
	"promise-migration/internal/sidapet/model/sidapet/rkeuanganpero"
	"promise-migration/internal/sidapet/model/sidapet/rpengalamanperomodel"
	"promise-migration/internal/sidapet/model/sidapet/rsertifperomodel"

	"github.com/jackc/pgx/v5"
	"log"
	"promise-migration/db"
	"promise-migration/internal/sidapet/helper"
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
	helper.TruncateTable("ref_datadiri_umum")
	helper.TruncateTable("ref_administrasi_pero")
	helper.TruncateTable("ref_personalia_pero")
	helper.TruncateTable("ref_pengalaman_pero")
	helper.TruncateTable("ref_sertif_pero")
	helper.TruncateTable("ref_keuangan_pero")

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

		// Insert to ref_datadiri_umum
		rdatadiriumummodel.InsertRefDataDiriUmum(profilePenyedia)

		radministrasiperomodel.InsertRefAdministrasiPero(profilePenyedia)
		rpersonaliaperomodel.InsertRefPersonaliaPero(profilePenyedia)
		rpengalamanperomodel.InsertRefPengalamanPero(profilePenyedia)
		rsertifperomodel.InsertRefSertifPero(profilePenyedia)
		rkeuanganpero.InsertRefKeuanganPero(profilePenyedia)
	}

	// Update sequence
	helper.UpdatePkSequence("ref_vendor", "kode_vendor")
	helper.UpdatePkSequence("ref_vendor_register", "kode_register")
	helper.UpdatePkSequence("ref_vendor_reg_history", "kode_register")

}
