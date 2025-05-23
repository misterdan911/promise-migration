package usermodel

import (
	"context"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
)

type User struct {
	Id              pgtype.Int4
	Name            pgtype.Text
	IdLevel         pgtype.Int4
	Email           pgtype.Text
	EmailReal       pgtype.Text
	Password        pgtype.Text
	IsPpk           pgtype.Int2
	IsPp            pgtype.Int2
	IsPkualitas     pgtype.Int2
	IsTutor         pgtype.Int2
	Undang          pgtype.Int2
	Internasional   pgtype.Int2
	RememberToken   pgtype.Text
	CreatedAt       pgtype.Text
	UpdatedAt       pgtype.Text
	EmailVerifiedAt pgtype.Text
	AndroUser       pgtype.Text
	AnggdroPassword pgtype.Text
}

func GetAllUser() []User {
	var allUser []User
	ctx := context.Background()

	qUser := `
	SELECT
		id,
		name,
		id_level,
		email,
		email_real,
		password,
		is_ppk,
		is_pp,
		is_pkualitas,
		is_tutor,
		undang,
		internasional,
		remember_token,
		created_at,
		updated_at,
		email_verified_at,
		andro_user,
		andro_password
	FROM users`

	rwUser, err := db.VmsDb.Query(ctx, qUser)
	if err != nil {
		log.Fatal("qUser Failed, " + err.Error() + " " + qUser)
	}

	allUser, err = pgx.CollectRows(rwUser, pgx.RowToStructByName[User])
	if err != nil {
		log.Fatal("failed collecting rwUser, " + err.Error())
	}
	defer rwUser.Close()

	return allUser
}

func GetUserById(userId pgtype.Int4) User {

	var user User
	ctx := context.Background()

	qUser := `SELECT email, "password" FROM users WHERE id = $1`
	rwUser, errUser := db.VmsDb.Query(ctx, qUser, userId)
	if errUser != nil {
		log.Fatal("qUser Failed, " + errUser.Error() + " " + qUser)
	}

	allUser, errUser := pgx.CollectRows(rwUser, pgx.RowToStructByName[User])
	if errUser != nil {
		log.Fatal("failed collecting rwUser, " + errUser.Error())
	}
	defer rwUser.Close()

	if len(allUser) > 0 {
		user = allUser[0]
	}

	return user
}
