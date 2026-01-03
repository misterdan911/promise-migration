package usman

import (
	"fmt"
	"promise-migration/internal/g"
	"promise-migration/internal/ghelper"
	"promise-migration/internal/model/dbesign/refpenandatanganmodel"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/model/dbsidapet/helperusernipmodel"
	promisesibela "promise-migration/internal/model/promise_sibela/tblprofilepenyediamodel"

	// "promise-migration/internal/model/vmsdb/tblpejabatpembeliansubmodel"
	// "promise-migration/internal/model/vmsdb/tblppksubmodel"
	"promise-migration/internal/model/vmsdb/tbllevelmodel"
	"promise-migration/internal/model/vmsdb/tblpejabatpembeliansubmodel"
	"promise-migration/internal/model/vmsdb/tblppksubmodel"
	vmspenyedia "promise-migration/internal/model/vmsdb/tblprofilepenyediamodel"
	"promise-migration/internal/structs"
	"promise-migration/internal/usman/model/vmsdb/usermodel"

	// "regexp"
	"strconv"
	"strings"

	"promise-migration/internal/model/dbusman/helperuserkodeunitmodel"

	"github.com/jackc/pgx/v5/pgtype"
)

var allHUserNip []helperusernipmodel.HelperUserNip

func PopulateHelperUser() {
	allVmsUser := usermodel.GetAllUser()
	allHUserNip = helperusernipmodel.GetAllHelperUserNip()
	allRefPenandatangan := refpenandatanganmodel.GetAllData()

	for _, vmsUser := range allVmsUser {

		// save to global variable
		g.User = g.GUser{
			Id:   vmsUser.Id,
			Name: vmsUser.Name,
		}

		// Mitigasi password supaya cocok dg sistem yg baru
		hashedPassword := vmsUser.Password.String
		// fmt.Println("hashedPassword: " + hashedPassword)
		// re := regexp.MustCompile(`^\$2[ayb]\$`)
		// newHashedPass := re.ReplaceAllString(hashedPassword, "$2b$")

		hashedPassword = strings.Replace(hashedPassword, "$2y$", "$2b$", 1)
		newHashedPass := strings.Replace(hashedPassword, "$2a$", "$2b$", 1)
		// fmt.Println("newHashedPass: " + newHashedPass)

		// coba cari data penyedia di db vms_db
		penyedia := vmspenyedia.GetPenyediaByUserId(vmsUser.Id)
		var dbPenyedia pgtype.Text
		var strDbPenyedia string
		var namaPenyedia pgtype.Text
		var jenisPenyedia pgtype.Text
		var kodeVendor pgtype.Int4

		if (penyedia == structs.TblProfilePenyedia{}) {
			// kalau data penyedia di vms_db gak ada, coba cari di db promise_sibela
			penyedia = promisesibela.GetPenyediaByUserId(vmsUser.Id)

			if (penyedia != structs.TblProfilePenyedia{}) {
				strDbPenyedia = "promise_sibela"
			}
		} else {
			strDbPenyedia = "vms_db"
		}

		// kalau data penyedia ditemukan, set nilai dbPenyedia, namaPenyedia, dan jenisPenyedia
		if (penyedia != structs.TblProfilePenyedia{}) {
			dbPenyedia = pgtype.Text{Valid: true, String: strDbPenyedia}
			namaPenyedia = pgtype.Text{Valid: true, String: penyedia.Nama.String}
			kodeVendor = vmsUser.Id

			if penyedia.IdJenisPenyedia.Int32 == 1 {
				jenisPenyedia = pgtype.Text{Valid: true, String: "perusahaan"}
			} else if penyedia.IdJenisPenyedia.Int32 == 2 {
				jenisPenyedia = pgtype.Text{Valid: true, String: "perorangan"}
			}
		} else {
			// kalau data penyedia tidak ditemukan, kasih catatan
			if vmsUser.IdLevel.Int32 == 5 || vmsUser.IdLevel.Int32 == 9 {
				//msg := "UserId: " + strconv.Itoa(int(vmsUser.Id.Int32)) + ", profile penyedia tidak ditemukan di vms_db ataupun di promise_sibela"
				penyedia := strconv.Itoa(int(vmsUser.Id.Int32)) + "_" + vmsUser.Name.String
				msg := "profile penyedia " + penyedia + " tidak ditemukan di vms_db ataupun di promise_sibela"
				fmt.Println(msg)
				ghelper.LogUser(msg)
			}
		}

		// kalau usernya bukan user penyedia, coba dapatkan NIP nya
		/*
			nip := pgtype.Text{}
			if (vmsUser.IdLevel.Int32 != 5) || (vmsUser.IdLevel.Int32 != 9) {
				// GetNip
				nip = GetNipByUserId(vmsUser.Id)
			}

			// kalau id_levelnya 6 (PP) atau 7 (PPK) coba dapatkan kode unit
			var kodeUnit pgtype.Text
			if vmsUser.IdLevel.Int32 == 6 {
				kodeUnit = tblpejabatpembeliansubmodel.GetKodeUnitByUserId(vmsUser.Id)
			} else if vmsUser.IdLevel.Int32 == 7 {
				kodeUnit = tblppksubmodel.GetKodeUnitByUserId(vmsUser.Id)
			}
		*/

		var nip pgtype.Text
		var kodeUnit pgtype.Text
		helperUserKodeUnit := helperuserkodeunitmodel.GetByEmail(vmsUser.EmailReal)
		nip = helperUserKodeUnit.Nip
		kodeUnit = helperUserKodeUnit.KodeUnit
		// fmt.Println("kodeUnit: " + kodeUnit.String)

		// Jabatan
		var jabatan = pgtype.Text{Valid: true}
		tblLevel := tbllevelmodel.GetById(vmsUser.IdLevel)

		if vmsUser.IdLevel.Int32 == 7 { // Apakah PPK
			allTblPpk := tblppksubmodel.GetJabatanByIdUser(vmsUser.Id)
			if len(allTblPpk) == 1 {
				jabatan.String = allTblPpk[0].UraianJabatan.String
			}
		} else if vmsUser.IdLevel.Int32 == 6 { // apakah Pejabat Penyediaan
			allTblPp := tblpejabatpembeliansubmodel.GetJabatanByIdUser(vmsUser.Id)
			if len(allTblPp) == 1 {
				jabatan.String = allTblPp[0].UraianJabatan.String
			}
		}

		if jabatan.String == "" {
			jabatan.String = tblLevel.Level
		}

		// Status User
		var statusUser = pgtype.Text{Valid: true}

		switch vmsUser.IdLevel.Int32 {
		case 1, 5, 9, 17, 20, 31, 32, 34:
			statusUser.String = "eksternal"
		default:
			statusUser.String = "internal"
		}

		// Kode Penandatangan
		var kodePenandatangan = pgtype.Int4{Valid: true}

		for _, refPenandatangan := range allRefPenandatangan {
			if vmsUser.EmailReal.String == refPenandatangan.Email.String {
				kodePenandatangan = refPenandatangan.KodePenandatangan
			}
		}

		helperUser := helperusermodel.HelperUser{
			Id:                vmsUser.Id,
			VmsUserId:         vmsUser.Id,
			VmsUserName:       vmsUser.Name,
			VmsUserLevel:      vmsUser.IdLevel,
			VmsUserEmail:      vmsUser.Email,
			VmsUserEmailReal:  vmsUser.EmailReal,
			VmsUserPass:       pgtype.Text{Valid: true, String: newHashedPass},
			VmsUserCreatedAt:  vmsUser.CreatedAt,
			VmsUserUpdatedAt:  vmsUser.UpdatedAt,
			Nip:               nip,
			KodeUnit:          kodeUnit,
			Jabatan:           jabatan,
			StatusUser:        statusUser,
			KodePenandatangan: kodePenandatangan,
			DbPenyedia:        dbPenyedia,
			NamaPenyedia:      namaPenyedia,
			JenisPenyedia:     jenisPenyedia,
			UsmanRefUserId:    vmsUser.Id,
			KodeVendor:        kodeVendor,
		}

		helperusermodel.InsertNew(helperUser)
	}

}

func GetNipByUserId(userId pgtype.Int4) pgtype.Text {
	for _, userNip := range allHUserNip {
		if userNip.IdUser.Int32 == userId.Int32 {
			return userNip.Nip
		}
	}
	return pgtype.Text{}
}
