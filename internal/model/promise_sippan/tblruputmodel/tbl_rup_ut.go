package tblruputmodel

import (
	"context"
	"log"
	
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"

	"promise-migration/db"
)

type KodeNoRup struct {
	KodeRup pgtype.Int4
	NoRup   pgtype.Text
}

type IdUserCreator struct {
	IdUser pgtype.Int4
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

func GetAllIdUserCreatorFromTblRupUt() []IdUserCreator{
	
	ctx := context.Background()

	qSelect := `select id_user from tbl_rup_ut group by id_user`

  rwSelect, err := db.ProSippan.Query(ctx, qSelect)
  if err != nil {
    log.Fatal("qSelect Failed, " + err.Error() + " " + qSelect)
  }

  allIdUserCreator, err := pgx.CollectRows(rwSelect, pgx.RowToStructByName[IdUserCreator])
  if err != nil {
    log.Fatal("failed collecting rwSelect (tbl_rup_ut.go:GetAllIdUserCreatorFromTblRupUt), " + err.Error())
  }
  defer rwSelect.Close()

	return allIdUserCreator
}
