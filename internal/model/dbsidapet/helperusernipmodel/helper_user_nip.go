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

func GetAllHelperUserNip() []HelperUserNip {
	ctx := context.Background()

	qGetAll := `
	SELECT id, id_user, nip FROM helper_user_nip
	ORDER BY id_user`

	rwUserNip, err := db.DbSidapet.Query(ctx, qGetAll)
	if err != nil {
		fmt.Println("qGetAll Failed, " + err.Error() + " " + qGetAll)
		return nil
	}

	allUserNip, err := pgx.CollectRows(rwUserNip, pgx.RowToStructByName[HelperUserNip])
	if err != nil {
		fmt.Println("failed collecting rwUserNip (GetAllHelperUserNip), " + err.Error())
		return nil
	}
	defer rwUserNip.Close()

	return allUserNip
}
