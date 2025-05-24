package refuserexternalmodel

import (
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
)

type RefUserExternal struct {
	IdUser         pgtype.Int4
	Username       pgtype.Text
	Nama           pgtype.Text
	Nik            pgtype.Text
	Siup           pgtype.Text
	StatusPengguna pgtype.Text
	Udcr           pgtype.Timestamptz
	Udch           pgtype.Timestamptz
	Id             pgtype.Int4
}

func InsertNew(user RefUserExternal) RefUserExternal {
	ctx := context.Background()

	qInsert := `
  INSERT INTO ref_user_external (
    username,
    nama,
    nik,
    siup,
    status_pengguna,
    udcr,
    udch,
    id_user
  ) VALUES (
		@username,
		@nama,
		@nik,
		@siup,
		@status_pengguna,
		@udcr,
		@udch,
		@id_user
	) RETURNING id`

	args := pgx.NamedArgs{
		"username":        user.Username,
		"nama":            user.Nama,
		"nik":             user.Nik,
		"siup":            user.Siup,
		"status_pengguna": user.StatusPengguna,
		"udcr":            user.Udcr,
		"udch":            user.Udch,
		"id_user":         user.IdUser,
	}

	rwIns, errIns := db.DbUsman.Query(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert ref_user_external, " + errIns.Error())
	}
	defer rwIns.Close()

	allUser, err := pgx.CollectRows(rwIns, pgx.RowToStructByName[RefUserExternal])
	if err != nil {
		log.Fatal("failed collecting RefUserExternal, " + err.Error())
	}

	return allUser[0]
}
