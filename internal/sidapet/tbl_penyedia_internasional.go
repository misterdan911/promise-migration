package sidapet

import (
	"promise-migration/internal/model/dbsidapet/refvendormodel"
	"promise-migration/internal/model/dbusman/refuserexternalmodel"
	"promise-migration/internal/model/vmsdb/tblpenyediainternasionalmodel"

	"github.com/jackc/pgx/v5/pgtype"
)

func HandlePenyediaInternasional() {

	allPenyediaInter := tblpenyediainternasionalmodel.GetAllData()

	for _, penyediaInter := range allPenyediaInter {

    // id_user 11 gak usah diproses
    if penyediaInter.IdUser.Int32 == 11 {
      continue
    }

		// update data di db_usman.ref_user_eksternal
    refUserExternal := refuserexternalmodel.RefUserExternal{
      IdUser: penyediaInter.IdUser,
      StatusPengguna: pgtype.Text{Valid: true, String: "internasional"},
    }
    refuserexternalmodel.UpdateStatusPengguna(refUserExternal)

    // insert data ke db_sidapet.ref_vendor
    refVendor := refvendormodel.RefVendor{
      KodeVendor: penyediaInter.IdUser,
      KodeJenisVendor: pgtype.Int4{Valid:true, Int32: 3}, // Internasional
      NamaPerusahaan: penyediaInter.CompanyName,
      IsTetap: pgtype.Bool{Valid: true, Bool: true},
      Udcr: penyediaInter.CreatedAt,
      Udch: penyediaInter.UpdatedAt,
      StatusFormLuarDpt: pgtype.Text{Valid: true, String: "selesai"},
      StatusAktifVendor: pgtype.Text{Valid: true, String: "aktif"},
    }
    refvendormodel.InsertNew(refVendor)
	}

}