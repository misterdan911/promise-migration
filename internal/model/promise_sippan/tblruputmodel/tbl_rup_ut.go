package tblruputmodel

import (
	"context"
	"promise-migration/db"
	"github.com/jackc/pgx/v5/pgtype"
)

type KodeNoRup struct {
	KodeRup pgtype.Int4
	NoRup   pgtype.Text
}

func GetNoRupByIdRupUt(IdRupUt pgtype.Int4) pgtype.Text {

	ctx := context.Background()

	qSelect := `
	SELECT 
		id_rup_ut,
		nomor_rup_ut
	FROM 
		tbl_rup_ut
	WHERE 
		id_rup_ut = $1
	`
	var kodeNoRup KodeNoRup

	err := db.ProSippan.QueryRow(ctx, qSelect, IdRupUt).Scan(
		&kodeNoRup.KodeRup,
		&kodeNoRup.NoRup,
	)
	if err != nil {
		return pgtype.Text{}
	}

	return kodeNoRup.NoRup
}
