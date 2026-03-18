package refuserexternalmodel

import (
	"context"
	"fmt"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type RefUserExternal struct {
	Id             pgtype.Int4
	IdUser         pgtype.Int4
	Username       pgtype.Text
	Nama           pgtype.Text
	Nik            pgtype.Text
	Siup           pgtype.Text
	StatusPengguna pgtype.Text
	Udcr           pgtype.Timestamptz
	Udch           pgtype.Timestamptz
}

func InsertNew(user RefUserExternal) {
	ctx := context.Background()

	qInsert := `
  INSERT INTO ref_user_external (
  	id,
    username,
    nama,
    nik,
    siup,
    status_pengguna,
    udcr,
    udch,
    id_user
  ) VALUES (
  	@id,
	@username,
	@nama,
	@nik,
	@siup,
	@status_pengguna,
	@udcr,
	@udch,
	@id_user
	) ON CONFLICT (id)
		DO UPDATE SET
  	id = EXCLUDED.id,
    username = EXCLUDED.username,
    nama = EXCLUDED.nama,
    nik = EXCLUDED.nik,
    siup = EXCLUDED.siup,
    status_pengguna = EXCLUDED.status_pengguna,
    udcr = EXCLUDED.udcr,
    udch = EXCLUDED.udch,
    id_user = EXCLUDED.id_user
  `

	args := pgx.NamedArgs{
		"id":              user.Id,
		"username":        user.Username,
		"nama":            user.Nama,
		"nik":             user.Nik,
		"siup":            user.Siup,
		"status_pengguna": user.StatusPengguna,
		"udcr":            user.Udcr,
		"udch":            user.Udch,
		"id_user":         user.IdUser,
	}

	_, errIns := db.DbUsman.Exec(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert ref_user_external, " + errIns.Error())
	}
}

func UpdateStatusPengguna(refUserExternal RefUserExternal) {
	ctx := context.Background()

	qUpdate := `UPDATE ref_user_external SET status_pengguna = @status_pengguna WHERE id_user = @id_user`

	args := pgx.NamedArgs{
		"status_pengguna": refUserExternal.StatusPengguna,
		"id_user": refUserExternal.IdUser,
	}

	_, errIns := db.DbUsman.Exec(ctx, qUpdate, args)
	if errIns != nil {
		fmt.Println("unable to update status_pengguna ref_user_external, " + errIns.Error())
	}

}