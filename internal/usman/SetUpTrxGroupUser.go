package usman

import(
	"context"
  "time"
  "github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"promise-migration/internal/model/dbusman/refusermodel"
	"promise-migration/internal/model/dbusman/trxgroupusermodel"
	"promise-migration/internal/model/promise_sippan/tblruputmodel"
	// "promise-migration/internal/model/vmsdb/tblprofilepenyediamodel"

  "fmt"
  "log"

  "promise-migration/db"


)

func PopulateTrxGroupUser() {

	// Setup Kepala UPBJ
	// SetupAksesKepalaUpbjForSidapet()
	
	// Setup user akses sippan
	SetupPpkAccessForSippan()

	// Setup user akses sidapet
	SetupVendorAccessForSidapet()
}

func SetupAksesKepalaUpbjForSidapet() {
	currentTime := time.Now().UTC()
	trxGroupUser := trxgroupusermodel.TrxGroupUser{
		KodeGroup: pgtype.Text{Valid: true, String: "G01.3"},
		IdUser:    pgtype.Int4{Valid: true, Int32: 10195},
		Status:    pgtype.Text{Valid: true, String: "1"},
		Udcr:      pgtype.Text{Valid: true, String: currentTime.String()},
	}
	trxgroupusermodel.InsertNew(trxGroupUser)
}

func SetupPpkAccessForSippan() {
	allIdUserCreator := tblruputmodel.GetAllIdUserCreatorFromTblRupUt()

	for _, idUserCreator := range allIdUserCreator {
		currentTime := time.Now().UTC()
		trxGroupUser := trxgroupusermodel.TrxGroupUser{
			KodeGroup: pgtype.Text{Valid: true, String: "G03.2"},
			IdUser:    idUserCreator.IdUser,
			Status:    pgtype.Text{Valid: true, String: "1"},
			Udcr:      pgtype.Text{Valid: true, String: currentTime.String()},
		}
		trxgroupusermodel.InsertNew(trxGroupUser)
			
	}
}

func SetupVendorAccessForSidapet(){
	/*
	allIdUserTblProfilePenyedia := tblprofilepenyediamodel.GetAllIdUser()
	allIdUserEksternal := refusermodel.GetAllIdUserEksternal()
	
	for _, idUser1 := range allIdUserTblProfilePenyedia {
		for _, idUser2 := range allIdUserEksternal {
			if idUser1.IdUser.Int32 == idUser2.Id.Int32 {
				
				currentTime := time.Now().UTC()
				trxGroupUser := trxgroupusermodel.TrxGroupUser{
					KodeGroup: pgtype.Text{Valid: true, String: "G01.8"},
					IdUser:    idUser2.Id,
					Status:    pgtype.Text{Valid: true, String: "1"},
					Udcr:      pgtype.Text{Valid: true, String: currentTime.String()},
				}
				trxgroupusermodel.InsertNew(trxGroupUser)
				
				break
			}
		}
	}
	*/

	allIdUserEksternal := refusermodel.GetAllIdUserEksternal()

	for _, idUser2 := range allIdUserEksternal {
		currentTime := time.Now().UTC()
		trxGroupUser := trxgroupusermodel.TrxGroupUser{
			KodeGroup: pgtype.Text{Valid: true, String: "G01.8"},
			IdUser:    idUser2.Id,
			Status:    pgtype.Text{Valid: true, String: "1"},
			Udcr:      pgtype.Text{Valid: true, String: currentTime.String()},
		}
		trxgroupusermodel.InsertNew(trxGroupUser)
	}

}




type UserData struct {
  IdUser pgtype.Int4
  KodeGroup pgtype.Text
  Email pgtype.Text
  Nama pgtype.Text
  KodeJabatan pgtype.Int4
  NamaJabatan pgtype.Text
  NamaAplikasi pgtype.Text
}

type DuplicateData struct {
  IdUser pgtype.Int4
  KodeGroup pgtype.Text
}

func SetupAccessForInternalUser() {

    ctx := context.Background()

    qUserData := `
    SELECT
      ru.id AS id_user,
      tut.email,
      tut.nama,
      tut.kode_jabatan,
      rj.nama_jabatan,
      ra.nama_aplikasi,
      rg.kode_group
    FROM trx_user_tampung tut
    LEFT JOIN ref_user ru on ru.email = tut.email
    LEFT JOIN ref_jabatan rj on rj.kode_jabatan = tut.kode_jabatan
    LEFT JOIN ref_group rg on rg.kode_jabatan = tut.kode_jabatan
    LEFT JOIN ref_aplikasi ra on ra.kode_aplikasi = rg.kode_aplikasi
    WHERE
      tut.email is NOT NULL AND
      rg.kode_group is NOT NULL AND
      ru.id IS NOT NULL AND
      ra.kode_aplikasi in ('01','02','03','04','05')
    ORDER BY ra.kode_aplikasi, rj.nama_jabatan asc;
    `

    rows, err := db.DbUsman.Query(ctx, qUserData)
    if err != nil {
      log.Fatal("qUserData Failed, " + err.Error() + " " + qUserData)
    }

    allUserData, err := pgx.CollectRows(rows, pgx.RowToStructByName[UserData])
    if err != nil {
      log.Fatal("failed collecting rows (qUserData), " + err.Error())
    }
    defer rows.Close()

    for _, userData := range allUserData {

      qCheckDuplicate := `SELECT kode_group, id_user FROM trx_group_user WHERE kode_group = $1 AND id_user = $2`
      rows2, err2 := db.DbUsman.Query(ctx, qCheckDuplicate, userData.KodeGroup, userData.IdUser)
      if err2 != nil {
        log.Fatal("qCheckDuplicate Failed, " + err2.Error() + " " + qCheckDuplicate)
      }
      allDuplicateData, err2 := pgx.CollectRows(rows2, pgx.RowToStructByName[DuplicateData])
      if err2 != nil {
        log.Fatal("failed collecting rows2 (qCheckDuplicate), " + err2.Error())
      }
      defer rows2.Close()

      // kalau data sudah ada, skip
      if len(allDuplicateData) > 0 { continue }

      qGrantAccess := `INSERT INTO trx_group_user (kode_group, id_user, status) VALUES ($1, $2, '1')`
      _, err3 := db.DbUsman.Exec(ctx, qGrantAccess, userData.KodeGroup, userData.IdUser)

      if err3 != nil {
        log.Fatal("failed INSERT trx_group_user, " + err3.Error())
      }

      fmt.Printf("Granting %v AS %v [OK]\n", userData.Nama.String, userData.NamaJabatan.String)

    }

}