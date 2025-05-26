package helperusermodel

import (
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"promise-migration/db"
)

type HelperUser struct {
	Id            pgtype.Int4
	VmsUserId     pgtype.Int4
	VmsUserName   pgtype.Text
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
    db_penyedia,
    nama_penyedia,
    jenis_penyedia
  ) VALUES (
    @vms_user_id,
    @vms_user_name,
    @db_penyedia,
    @nama_penyedia,
    @jenis_penyedia
	)`

	args := pgx.NamedArgs{
		"vms_user_id":    helperUser.VmsUserId,
		"vms_user_name":  helperUser.VmsUserName,
		"db_penyedia":    helperUser.DbPenyedia,
		"nama_penyedia":  helperUser.NamaPenyedia,
		"jenis_penyedia": helperUser.JenisPenyedia,
	}

	_, errIns := db.DbSidapet.Exec(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert helper_user, " + errIns.Error())
	}
}
