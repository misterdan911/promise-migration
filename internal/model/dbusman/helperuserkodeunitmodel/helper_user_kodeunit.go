package helperuserkodeunitmodel

import (
	"context"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type HelperUserKodeunit struct {
	ID       pgtype.Int4
	Email    pgtype.Text
	KodeUnit pgtype.Text
	Nip      pgtype.Text
}

func GetByEmail(email pgtype.Text) HelperUserKodeunit {
	var helperUserKodeunit HelperUserKodeunit
	ctx := context.Background()

	qHelperUserKodeunit := `
	SELECT
		id,
		email,
		kode_unit,
		nip
	FROM helper_user_kodeunit huk
	WHERE email = $1`

	rwHelperUserKodeunit, err := db.DbUsman.Query(ctx, qHelperUserKodeunit, email)
	if err != nil {
		log.Fatal("qHelperUserKodeunit Failed, " + err.Error() + " " + qHelperUserKodeunit)
	}

	allUserKodeunit, err := pgx.CollectRows(rwHelperUserKodeunit, pgx.RowToStructByName[HelperUserKodeunit])
	if err != nil {
		log.Fatal("failed collecting rwHelperUserKodeunit (helperuserkodeunit.go:GetByEmail), " + err.Error())
	}
	defer rwHelperUserKodeunit.Close()

	if len(allUserKodeunit) > 0 {
		helperUserKodeunit = allUserKodeunit[0]
	}

	return helperUserKodeunit
}
