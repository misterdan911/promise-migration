package refusermodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type RefUser struct {
	Id              pgtype.Int4
	Email           pgtype.Text
	Password        pgtype.Text
	ApiToken        pgtype.Text
	IsLogin         pgtype.Text
	Ucr             pgtype.Text
	Uch             pgtype.Text
	Udcr            pgtype.Timestamptz
	Udch            pgtype.Timestamptz
	UserPhoto       pgtype.Text
	StatusUser      pgtype.Text
	ForgetTokenPass pgtype.Text
	Otp             pgtype.Text
	OtpTime         pgtype.Timestamptz
}

type Id struct {
	Id              pgtype.Int4
}

func GetAllData() []RefUser {
	var allUsers []RefUser
	ctx := context.Background()

	qRefUser := `
  SELECT
      id,
      email,
      password,
      api_token,
      is_login,
      ucr,
      uch,
      udcr,
      udch,
      user_photo,
      status_user,
      forget_token_pass,
      otp,
      otp_time
  FROM ref_user`

	rows, err := db.DbUsman.Query(ctx, qRefUser)
	if err != nil {
		log.Fatal("qRefUser Failed, " + err.Error() + " " + qRefUser)
	}

	allUsers, err = pgx.CollectRows(rows, pgx.RowToStructByName[RefUser])
	if err != nil {
		log.Fatal("failed collecting rows (ref_user.go:GetAllData), " + err.Error())
	}
	defer rows.Close()

	return allUsers
}

func InsertNew(refUser RefUser) RefUser {
	ctx := context.Background()

	qInsert := `
  INSERT INTO ref_user (
  		id,
		email,
		password,
		api_token,
		is_login,
		ucr,
		uch,
		udcr,
		udch,
		user_photo,
		status_user,
		forget_token_pass,
		otp,
		otp_time
  ) VALUES (
   		@id,
		@email,
		@password,
		@api_token,
		@is_login,
		@ucr,
		@uch,
		@udcr,
		@udch,
		@user_photo,
		@status_user,
		@forget_token_pass,
		@otp,
		@otp_time
	) RETURNING *`

	args := pgx.NamedArgs{
		"id":                refUser.Id,
		"email":             refUser.Email,
		"password":          refUser.Password,
		"api_token":         refUser.ApiToken,
		"is_login":          refUser.IsLogin,
		"ucr":               refUser.Ucr,
		"uch":               refUser.Uch,
		"udcr":              refUser.Udcr,
		"udch":              refUser.Udch,
		"user_photo":        refUser.UserPhoto,
		"status_user":       refUser.StatusUser,
		"forget_token_pass": refUser.ForgetTokenPass,
		"otp":               refUser.Otp,
		"otp_time":          refUser.OtpTime,
	}

	rwIns, errIns := db.DbUsman.Query(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert ref_user, " + errIns.Error())
	}
	defer rwIns.Close()

	allUser, err := pgx.CollectRows(rwIns, pgx.RowToStructByName[RefUser])
	if err != nil {
		log.Fatal("failed collecting RefUser (ref_user.go), " + err.Error())
	}

	return allUser[0]
}

func DeleteByEmail(email pgtype.Text) {
	ctx := context.Background()

	qDelete := `DELETE FROM ref_user WHERE email = $1`
	_, err := db.DbUsman.Exec(ctx, qDelete, email)
	if err != nil {
		log.Fatal("failed deleting RefUser (ref_user.go), " + err.Error())
	}

}

func GetAllIdUserEksternal() []Id {
	var allUsers []Id
	ctx := context.Background()

	qRefUser := `
  SELECT id FROM ref_user WHERE status_user = 'external'`

	rows, err := db.DbUsman.Query(ctx, qRefUser)
	if err != nil {
		log.Fatal("qRefUser Failed, " + err.Error() + " " + qRefUser)
	}

	allUsers, err = pgx.CollectRows(rows, pgx.RowToStructByName[Id])
	if err != nil {
		log.Fatal("failed collecting rows (ref_user.go:GetAllData), " + err.Error())
	}
	defer rows.Close()

	return allUsers
	
}
