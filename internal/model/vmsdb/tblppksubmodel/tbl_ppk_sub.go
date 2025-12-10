package tblppksubmodel

import (
	"context"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type KodeUnit struct {
	KodeUnit pgtype.Text
}

type TblPpkSub struct {
	KodeUnit pgtype.Text
	Nip      pgtype.Text
}

type IdUserPpkActive struct {
	IdUser pgtype.Int4
}


func GetKodeUnitByUserId(userId pgtype.Int4) pgtype.Text {

	ctx := context.Background()
	var kodeUnit pgtype.Text

	qKodeInput := `
	SELECT kode_unit
	FROM tbl_ppk_sub tps
	LEFT JOIN tbl_ppk tp ON tps.id_ppk = tp.id_ppk
	WHERE id_user = $1`

	// args := pgx.NamedArgs{
	// 	"id_user":        userId,
	// }

	rwPPK, err := db.VmsDb.Query(ctx, qKodeInput, userId)
	if err != nil {
		log.Fatal("qKodeInput Failed, " + err.Error() + " " + qKodeInput)
	}

	allRows, err := pgx.CollectRows(rwPPK, pgx.RowToStructByName[KodeUnit])
	if err != nil {
		log.Fatal("failed collecting rwPPK (tbl_ppk_sub.go), " + err.Error())
	}
	defer rwPPK.Close()

	if len(allRows) > 0 {
		kodeUnit = allRows[0].KodeUnit
	}

	return kodeUnit
}

func GetPpkSubByIdUser(userId pgtype.Int4) TblPpkSub {

	ctx := context.Background()
	var tblPpkSub TblPpkSub

	qKodeInput := `
	SELECT tp.kode_unit, tps.nip_ppk as nip
	FROM tbl_ppk_sub tps
	LEFT JOIN tbl_ppk tp ON tps.id_ppk = tp.id_ppk
	WHERE id_user = $1`

	rwPPK, err := db.VmsDb.Query(ctx, qKodeInput, userId)
	if err != nil {
		log.Fatal("qKodeInput Failed, " + err.Error() + " " + qKodeInput)
	}

	allRows, err := pgx.CollectRows(rwPPK, pgx.RowToStructByName[TblPpkSub])
	if err != nil {
		log.Fatal("failed collecting rwPPK (tbl_ppk_sub.go), " + err.Error())
	}
	defer rwPPK.Close()

	if len(allRows) > 0 {
		tblPpkSub = allRows[0]
	}

	return tblPpkSub
}

func GetUserIdUserPpkActive(idPpk pgtype.Int4) pgtype.Int4{

	ctx := context.Background()
	var tblPpkSub IdUserPpkActive

	qSelect := `
	SELECT id_user
	FROM tbl_ppk_sub tps
	WHERE
		id_ppk = $1 AND
		status = 1`

	rwPPK, err := db.VmsDb.Query(ctx, qSelect, idPpk)
	if err != nil {
		log.Fatal("qSelect Failed, " + err.Error() + " " + qSelect)
	}

	allRows, err := pgx.CollectRows(rwPPK, pgx.RowToStructByName[IdUserPpkActive])
	if err != nil {
		log.Fatal("failed collecting rwPPK (tbl_ppk_sub.go:GetUserIdUserPpkActive), " + err.Error())
	}
	defer rwPPK.Close()

	if len(allRows) > 0 {
		tblPpkSub = allRows[0]
	}

	return tblPpkSub.IdUser
}
