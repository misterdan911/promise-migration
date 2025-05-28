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
	Id            pgtype.Int4
	VmsUserId     pgtype.Int4
	VmsUserName   pgtype.Text
	VmsUserLevel  pgtype.Int4
	VmsUserEmail  pgtype.Text
	VmsUserPass   pgtype.Text
	DbPenyedia    pgtype.Text
	NamaPenyedia  pgtype.Text
	JenisPenyedia pgtype.Text
}

func InsertNew(helperUser HelperUser) {

	ctx := context.Background()

	qInsert := `
  INSERT INTO helper_user (
    vms_user_id,
    vms_user_name,
    vms_user_level,
    vms_user_email,
    vms_user_pass,
    db_penyedia,
    nama_penyedia,
    jenis_penyedia
  ) VALUES (
    @vms_user_id,
    @vms_user_name,
    @vms_user_level,
    @vms_user_email,
    @vms_user_pass,
    @db_penyedia,
    @nama_penyedia,
    @jenis_penyedia
  )`

	args := pgx.NamedArgs{
		"vms_user_id":    helperUser.VmsUserId,
		"vms_user_name":  helperUser.VmsUserName,
		"vms_user_level": helperUser.VmsUserLevel,
		"vms_user_email": helperUser.VmsUserEmail,
		"vms_user_pass":  helperUser.VmsUserPass,
		"db_penyedia":    helperUser.DbPenyedia,
		"nama_penyedia":  helperUser.NamaPenyedia,
		"jenis_penyedia": helperUser.JenisPenyedia,
	}

	_, errIns := db.DbSidapet.Exec(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert helper_user, " + errIns.Error())
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
    db_penyedia,
    nama_penyedia,
    jenis_penyedia
	FROM helper_user`

	rwHUser, err := db.VmsDb.Query(ctx, qHUser)
	if err != nil {
		log.Fatal("qHUser Failed, " + err.Error() + " " + qHUser)
	}

	allUser, err = pgx.CollectRows(rwHUser, pgx.RowToStructByName[HelperUser])
	if err != nil {
		log.Fatal("failed collecting rwHUser (helperuser.go), " + err.Error())
	}
	defer rwHUser.Close()

	return allUser
}
