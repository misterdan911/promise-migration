package helpersignaturekodepenandatanganmodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type HelperSignatureKodePenandatangan struct {
	KodeHelper         pgtype.Int4
	IdUser             pgtype.Int4
	IdProfilPenyedia   pgtype.Int4
	IdDireksiPerus     pgtype.Int4
	JenisPaket         pgtype.Text
	KodePenandatangan  pgtype.Int4
}

func GetKodePenandatangan(idProfilPenyedia pgtype.Int4, idDireksiPerus pgtype.Int4, jenisPaket pgtype.Text) {
	var allData []HelperSignatureKodePenandatangan
	ctx := context.Background()

	qData := `SELECT * FROM helper_signature_penandatangan
	WHERE id_profil_penyedia = $1 AND id_direksi_perus = $2 AND jenis_paket = $3`

	rwHUser, err := db.DbSidapet.Query(ctx, qData, idProfilPenyedia, idDireksiPerus, jenisPaket)
	if err != nil {
		log.Fatal("qData Failed, " + err.Error() + " " + qData)
	}

	allUser, err = pgx.CollectRows(rwHUser, pgx.RowToStructByName[HelperUser])
	if err != nil {
		log.Fatal("failed collecting rwHUser (helperuser.go:GetAllUser), " + err.Error())
	}
	defer rwHUser.Close()

	return allUser

}

func InsertNew(helperUser HelperUser) {

	ctx := context.Background()

	qInsert := `
  INSERT INTO helper_user (
    id,
    vms_user_id,
    vms_user_name,
    vms_user_level,
    vms_user_email,
    vms_user_email_real,
    vms_user_pass,
    vms_user_created_at,
    vms_user_updated_at,
    nip,
    kode_unit,
		jabatan,
		status_user,
		kode_penandatangan,
    db_penyedia,
    nama_penyedia,
    jenis_penyedia,
    usman_ref_user_id,
    kode_vendor,
    is_tetap
  ) VALUES (
    @id,
    @vms_user_id,
    @vms_user_name,
    @vms_user_level,
    @vms_user_email,
    @vms_user_email_real,
    @vms_user_pass,
    @vms_user_created_at,
    @vms_user_updated_at,
    @nip,
    @kode_unit,
		@jabatan,
		@status_user,
		@kode_penandatangan,
    @db_penyedia,
    @nama_penyedia,
    @jenis_penyedia,
    @usman_ref_user_id,
    @kode_vendor,
    @is_tetap
  )`

	args := pgx.NamedArgs{
		"id":                  helperUser.VmsUserId,
		"vms_user_id":         helperUser.VmsUserId,
		"vms_user_name":       helperUser.VmsUserName,
		"vms_user_level":      helperUser.VmsUserLevel,
		"vms_user_email":      helperUser.VmsUserEmail,
		"vms_user_email_real": helperUser.VmsUserEmailReal,
		"vms_user_pass":       helperUser.VmsUserPass,
		"vms_user_created_at": helperUser.VmsUserCreatedAt,
		"vms_user_updated_at": helperUser.VmsUserUpdatedAt,
		"nip":                 helperUser.Nip,
		"kode_unit":           helperUser.KodeUnit,
		"jabatan":             helperUser.Jabatan,
		"status_user":         helperUser.StatusUser,
		"kode_penandatangan":  helperUser.KodePenandatangan,
		"db_penyedia":         helperUser.DbPenyedia,
		"nama_penyedia":       helperUser.NamaPenyedia,
		"jenis_penyedia":      helperUser.JenisPenyedia,
		"usman_ref_user_id":   helperUser.UsmanRefUserId,
		"kode_vendor":         helperUser.KodeVendor,
		"is_tetap":            helperUser.IsTetap,
	}

	_, errIns := db.DbSidapet.Exec(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert helper_user, " + errIns.Error())
		log.Fatal("unable to insert helper_user, " + errIns.Error())
	}
}

func GetAllUser() []HelperUser {

	var allUser []HelperUser
	ctx := context.Background()

	qHUser := `SELECT * FROM helper_user`

	rwHUser, err := db.DbSidapet.Query(ctx, qHUser)
	if err != nil {
		log.Fatal("qHUser Failed, " + err.Error() + " " + qHUser)
	}

	allUser, err = pgx.CollectRows(rwHUser, pgx.RowToStructByName[HelperUser])
	if err != nil {
		log.Fatal("failed collecting rwHUser (helperuser.go:GetAllUser), " + err.Error())
	}
	defer rwHUser.Close()

	return allUser
}

func UpdateKodeVendor(helperUser HelperUser) {
	ctx := context.Background()
	qUpdate := `UPDATE helper_user SET kode_vendor = @kode_vendor WHERE id = @id`
	args := pgx.NamedArgs{
		"id":          helperUser.Id,
		"kode_vendor": helperUser.KodeVendor,
	}

	_, err := db.DbSidapet.Exec(ctx, qUpdate, args)
	if err != nil {
		fmt.Println("unable to update kode_vendor (helperuser.go), " + err.Error())
	}
}

func UpdateUsmanRefUserIdByEmail(helperUser HelperUser) {
	ctx := context.Background()
	qUpdate := `UPDATE helper_user SET usman_ref_user_id = @usman_ref_user_id WHERE vms_user_email = @email`
	args := pgx.NamedArgs{
		"email":             helperUser.VmsUserEmail,
		"usman_ref_user_id": helperUser.UsmanRefUserId,
	}

	_, err := db.DbSidapet.Exec(ctx, qUpdate, args)
	if err != nil {
		fmt.Println("unable to update usman_ref_user_id (helperuser.go), " + err.Error())
	}
}

func GetByVmsUserId(vmsUserId pgtype.Int4) HelperUser {
	var helperUser HelperUser
	ctx := context.Background()

	qHUser := `
  SELECT * FROM helper_user hu
  WHERE vms_user_id = $1`

	rwHUser, err := db.DbSidapet.Query(ctx, qHUser, vmsUserId)
	if err != nil {
		log.Fatal("qHUser Failed, " + err.Error() + " " + qHUser)
	}

	allUser, err := pgx.CollectRows(rwHUser, pgx.RowToStructByName[HelperUser])
	if err != nil {
		log.Fatal("failed collecting rwHUser (helperuser.go:GetByVmsUserId), " + err.Error())
	}
	defer rwHUser.Close()

	if len(allUser) > 0 {
		helperUser = allUser[0]
	}

	return helperUser

}

func GetByVmsUserEmail(vmsUserEmail pgtype.Text) HelperUser {
	var helperUser HelperUser
	ctx := context.Background()

	qHUser := `
  SELECT * FROM helper_user hu
  WHERE vms_user_email = $1`

	rwHUser, err := db.DbSidapet.Query(ctx, qHUser, vmsUserEmail)
	if err != nil {
		log.Fatal("qHUser Failed, " + err.Error() + " " + qHUser)
	}

	allUser, err := pgx.CollectRows(rwHUser, pgx.RowToStructByName[HelperUser])
	if err != nil {
		log.Fatal("failed collecting rwHUser (helperuser.go:GetByVmsUserEmail), " + err.Error())
	}
	defer rwHUser.Close()

	if len(allUser) > 0 {
		helperUser = allUser[0]
	}

	return helperUser

}

func GetAllUserDpt() []HelperUser {

	var allUser []HelperUser
	ctx := context.Background()

	qHUser := `SELECT * FROM helper_user WHERE is_tetap = true`

	rwHUser, err := db.DbSidapet.Query(ctx, qHUser)
	if err != nil {
		log.Fatal("qHUser Failed, " + err.Error() + " " + qHUser)
	}

	allUser, err = pgx.CollectRows(rwHUser, pgx.RowToStructByName[HelperUser])
	if err != nil {
		log.Fatal("failed collecting rwHUser (helperuser.go:GetAllUser), " + err.Error())
	}
	defer rwHUser.Close()

	return allUser
}


