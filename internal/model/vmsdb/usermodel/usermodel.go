package usermodel

import (
	"context"
	"log"
	"promise-migration/db"
	"runtime"
	"strconv"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
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
	CreatedAt       pgtype.Timestamptz
	UpdatedAt       pgtype.Timestamptz
	EmailVerifiedAt pgtype.Timestamptz
	AndroUser       pgtype.Text
	AndroPassword   pgtype.Text
}

func GetCurrentLine() string {
	_, _, line, _ := runtime.Caller(1)
	return strconv.Itoa(line)
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
		log.Fatal("failed collecting rwUser (usermodel.go line: " + GetCurrentLine() + "), " + err.Error())
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
		//log.Fatal("failed collecting rwUser, " + errUser.Error())
		log.Fatal("failed collecting rwUser (usermodel.go line: " + GetCurrentLine() + "), " + errUser.Error())
	}
	defer rwUser.Close()

	if len(allUser) > 0 {
		user = allUser[0]
	}

	return user
}

func GetAllInternalUser() []User {
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
	FROM users
  WHERE id_level not in (1,5,9,17,20,31,32,34)
  `

	rwUser, err := db.VmsDb.Query(ctx, qUser)
	if err != nil {
		log.Fatal("qUser Failed, " + err.Error() + " " + qUser)
	}

	allUser, err = pgx.CollectRows(rwUser, pgx.RowToStructByName[User])
	if err != nil {
		log.Fatal("failed collecting rwUser (usermodel.go::GetAllInternalUser), " + err.Error())
	}
	defer rwUser.Close()

	return allUser
}

func GetAllExternalUser() []User {
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
	FROM users
  WHERE id_level in (1,5,9,17,20,31,32,34)
  `

	rwUser, err := db.VmsDb.Query(ctx, qUser)
	if err != nil {
		log.Fatal("qUser Failed, " + err.Error() + " " + qUser)
	}

	allUser, err = pgx.CollectRows(rwUser, pgx.RowToStructByName[User])
	if err != nil {
		log.Fatal("failed collecting rwUser (usermodel.go::GetAllInternalUser), " + err.Error())
	}
	defer rwUser.Close()

	return allUser
}
func GetUserByEmailReal(emailReal pgtype.Text) User {
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
	FROM users
	WHERE email = $1`

	rwUser, err := db.VmsDb.Query(ctx, qUser, emailReal)
	if err != nil {
		log.Fatal("qUser Failed, " + err.Error() + " " + qUser)
	}

	allUser, err = pgx.CollectRows(rwUser, pgx.RowToStructByName[User])
	if err != nil {
		log.Fatal("failed collecting rwUser (usermodel.go line: " + GetCurrentLine() + "), " + err.Error())
	}
	defer rwUser.Close()

	var userReal User
	if len(allUser) > 0 {
		userReal = allUser[0]
	}

	return userReal

}
