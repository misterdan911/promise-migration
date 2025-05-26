package refusermodel

import (
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
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

func InsertNew(refUser RefUser) RefUser {
	ctx := context.Background()

	qInsert := `
  INSERT INTO ref_user (
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
