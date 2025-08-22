package refuserinternalmodel

import (
	"context"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type RefUserInternal struct {
	Id       pgtype.Int4
	Nip      pgtype.Text
	Username pgtype.Text
	Udcr     pgtype.Timestamptz
	Udch     pgtype.Timestamptz
	IdUser   pgtype.Int4
}

func InsertNew(user RefUserInternal) {
	ctx := context.Background()

	qInsert := `
  INSERT INTO ref_user_internal (
    nip,
    username,
    udcr,
    udch,
    id_user
  ) VALUES (
    @nip,
    @username,
    @udcr,
    @udch,
    @id_user
  )`

	args := pgx.NamedArgs{
		"nip":      user.Nip,
		"username": user.Username,
		"udcr":     user.Udcr,
		"udch":     user.Udch,
		"id_user":  user.IdUser,
	}

	_, errIns := db.DbUsman.Exec(ctx, qInsert, args)
	if errIns != nil {
		log.Fatal("unable to insert ref_user_internal, " + errIns.Error())
	}
}
