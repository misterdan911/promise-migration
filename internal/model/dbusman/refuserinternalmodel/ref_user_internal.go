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

func InsertNew(refUserInternal RefUserInternal) {
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
		"nip":      refUserInternal.Nip,
		"username": refUserInternal.Username,
		"udcr":     refUserInternal.Udcr,
		"udch":     refUserInternal.Udch,
		"id_user":  refUserInternal.IdUser,
	}

	_, errIns := db.DbUsman.Exec(ctx, qInsert, args)
	if errIns != nil {
		log.Fatal("unable to insert ref_user_internal, " + errIns.Error())
	}
}
