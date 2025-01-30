package usermodel

import (
	"context"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
	"promise-migration/internal/sidapet/structs"
)

func GetUserById(userId pgtype.Int4) structs.User {

	var user structs.User

	ctx := context.Background()
	qUser := `SELECT email, "password" FROM users WHERE id = $1`
	rwUser, errUser := db.VmsDb.Query(ctx, qUser, userId)
	if errUser != nil {
		log.Fatal("qUser Failed, " + errUser.Error() + " " + qUser)
	}

	allUser, errUser := pgx.CollectRows(rwUser, pgx.RowToStructByName[structs.User])
	if errUser != nil {
		log.Fatal("failed collecting rwUser, " + errUser.Error())
	}
	defer rwUser.Close()

	if len(allUser) > 0 {
		user = allUser[0]
	}

	return user
}
