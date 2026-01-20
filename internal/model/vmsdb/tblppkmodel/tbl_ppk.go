package tblppkmodel

import (
 "context"
 "log"

 "github.com/jackc/pgx/v5"
 "github.com/jackc/pgx/v5/pgtype"

 "promise-migration/db"
)

type UnitPpk struct {
	IdPpk pgtype.Int4
	KodeUnit pgtype.Text
	NamaUnit pgtype.Text
}

func GetUnitByIdPpk(idPpk pgtype.Int4) UnitPpk {

	var unitPpk UnitPpk

	ctx := context.Background()

	qSelect := `
	SELECT
	  tbl_ppk.id_ppk,
	  tbl_ppk.kode_unit,
	  tus.nama_unit 
	FROM
	  tbl_ppk
	  LEFT JOIN tbl_unit_sub tus ON tus.id_unit_sub = tbl_ppk.id_unit_sub
	WHERE tbl_ppk.id_ppk = $1
	`

	rSelect, err := db.VmsDb.Query(ctx, qSelect, idPpk)
	if err != nil {
	log.Fatal("qSelect Failed, " + err.Error() + " " + qSelect)
	}

	allRows, err := pgx.CollectRows(rSelect, pgx.RowToStructByName[UnitPpk])
	if err != nil {
	log.Fatal("failed collecting tbl_select, " + err.Error())
	}
	defer rSelect.Close()

	if len(allRows) > 0 {
		unitPpk = allRows[0]
	}

	return unitPpk
}