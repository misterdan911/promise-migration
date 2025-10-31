package tblpejabatpembeliansubmodel

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

type TblPejabatPembelianSub struct {
	KodeUnit pgtype.Text
	Nip      pgtype.Text
}

func GetKodeUnitByUserId(userId pgtype.Int4) pgtype.Text {

	ctx := context.Background()
	var kodeUnit pgtype.Text

	qKodeInput := `
	SELECT kode_unit
	FROM tbl_pejabat_pembelian_sub tpps
	LEFT JOIN tbl_pejabat_pembelian tpp ON tpps.id_pejabat_pembelian = tpp.id_pejabat_pembelian
	WHERE id_user = $1`

	// args := pgx.NamedArgs{
	// 	"id_user":        userId,
	// }

	rwPP, err := db.VmsDb.Query(ctx, qKodeInput, userId)
	if err != nil {
		log.Fatal("qKodeInput Failed, " + err.Error() + " " + qKodeInput)
	}

	allRows, err := pgx.CollectRows(rwPP, pgx.RowToStructByName[KodeUnit])
	if err != nil {
		log.Fatal("failed collecting rwPP (tbl_pejabat_pembelian_sub.go), " + err.Error())
	}
	defer rwPP.Close()

	if len(allRows) > 0 {
		kodeUnit = allRows[0].KodeUnit
	}

	return kodeUnit
}

func GetPpByIdUser(userId pgtype.Int4) TblPejabatPembelianSub {

	ctx := context.Background()
	var tblPejabatPembelianSub TblPejabatPembelianSub

	qKodeInput := `
	SELECT tpp.kode_unit, tpps.nip_pp as nip
	FROM tbl_pejabat_pembelian_sub tpps
	LEFT JOIN tbl_pejabat_pembelian tpp ON tpps.id_pejabat_pembelian = tpp.id_pejabat_pembelian
	WHERE id_user = $1`

	rwPP, err := db.VmsDb.Query(ctx, qKodeInput, userId)
	if err != nil {
		log.Fatal("qKodeInput Failed, " + err.Error() + " " + qKodeInput)
	}

	allRows, err := pgx.CollectRows(rwPP, pgx.RowToStructByName[TblPejabatPembelianSub])
	if err != nil {
		log.Fatal("failed collecting rwPP (tbl_pejabat_pembelian_sub.go::GetPpByIdUser), " + err.Error())
	}
	defer rwPP.Close()

	if len(allRows) > 0 {
		tblPejabatPembelianSub = allRows[0]
	}

	return tblPejabatPembelianSub
}
