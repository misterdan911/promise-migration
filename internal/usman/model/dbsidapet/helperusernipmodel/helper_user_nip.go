package helperusernipmodel

import (
	"context"
	"fmt"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type HelperUserNip struct {
	Id     pgtype.Int4
	IdUser pgtype.Int4
	Nip    pgtype.Text
}

func InsertNew(helperUserNip HelperUserNip) {

	ctx := context.Background()

	qInsert := `
  INSERT INTO helper_user_nip (
		id_user,
		nip
  ) VALUES (
		@id_user,
		@nip
  )`

	args := pgx.NamedArgs{
		"id_user": helperUserNip.IdUser,
		"nip":     helperUserNip.Nip,
	}

	_, errIns := db.DbSidapet.Exec(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert helper_user_nip, " + errIns.Error())
	}
}
