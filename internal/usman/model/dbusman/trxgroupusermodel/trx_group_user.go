package trxgroupusermodel

import (
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"promise-migration/db"
	"promise-migration/internal/usman/model/dbusman/refusermodel"
	"time"
)

type TrxGroupUser struct {
	IdGroupUser pgtype.Int4
	KodeGroup   pgtype.Text
	IdUser      pgtype.Int4
	Status      pgtype.Text
	Ucr         pgtype.Text
	Uch         pgtype.Text
	Udcr        pgtype.Text
	Udch        pgtype.Text
}

func InsertNew(trxgroupuser TrxGroupUser) {

	ctx := context.Background()

	qInsert := `
  INSERT INTO trx_group_user (
		kode_group,
		id_user,
		status,
		ucr,
		uch,
		udcr,
		udch
  ) VALUES (
		@kode_group,
		@id_user,
		@status,
		@ucr,
		@uch,
		@udcr,
		@udch
	)`

	args := pgx.NamedArgs{
		"kode_group": trxgroupuser.KodeGroup,
		"id_user":    trxgroupuser.IdUser,
		"status":     trxgroupuser.Status,
		"ucr":        trxgroupuser.Ucr,
		"uch":        trxgroupuser.Uch,
		"udcr":       trxgroupuser.Udcr,
		"udch":       trxgroupuser.Udch,
	}

	_, errIns := db.DbUsman.Exec(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert trx_group_user, " + errIns.Error())
	}
}
