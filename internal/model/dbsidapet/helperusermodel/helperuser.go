package helperusermodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type HelperUser struct {
	Id               pgtype.Int4
	VmsUserId        pgtype.Int4
	VmsUserName      pgtype.Text
	VmsUserLevel     pgtype.Int4
	VmsUserEmail     pgtype.Text
	VmsUserEmailReal pgtype.Text
	VmsUserPass      pgtype.Text
	VmsUserCreatedAt pgtype.Timestamptz
	VmsUserUpdatedAt pgtype.Timestamptz
	Nip              pgtype.Text
	KodeUnit         pgtype.Text

	Jabatan           pgtype.Text
	StatusUser        pgtype.Text
	KodePenandatangan pgtype.Int4

	DbPenyedia     pgtype.Text
	NamaPenyedia   pgtype.Text
	JenisPenyedia  pgtype.Text
	UsmanRefUserId pgtype.Int4
	KodeVendor     pgtype.Int4
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
    kode_vendor
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
    @kode_vendor
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

	qHUser := `
  SELECT
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
    db_penyedia,
    nama_penyedia,
    jenis_penyedia,
    usman_ref_user_id,
    kode_vendor
  FROM helper_user hu`

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
  SELECT
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
    db_penyedia,
    nama_penyedia,
    jenis_penyedia,
    usman_ref_user_id,
    kode_vendor
  FROM helper_user hu
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
  SELECT
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
    db_penyedia,
    nama_penyedia,
    jenis_penyedia,
    usman_ref_user_id,
    kode_vendor
  FROM helper_user hu
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
