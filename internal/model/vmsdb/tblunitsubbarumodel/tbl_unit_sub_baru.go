package tblunitsubbarumodel

import (
	"context"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type NamaUnit struct {
	NamaUnit     pgtype.Text
	NamaUnitLama pgtype.Text
}

func GetNamaUnitByKodeUnit(kodeUnit pgtype.Text) pgtype.Text {
	ctx := context.Background()
	var namaUnit pgtype.Text

	qNamaUnit := `
	SELECT
		nama_unit,
		nama_unit_lama
	FROM tbl_unit_sub_baru
	WHERE
		kode_unit_kerja = $1 OR
		kode_unit_kerja_lama = $1`

	rSelect, err := db.VmsDb.Query(ctx, qNamaUnit, kodeUnit)
	if err != nil {
		log.Fatal("qNamaUnit Failed, " + err.Error() + " " + qNamaUnit)
	}

	allRows, err := pgx.CollectRows(rSelect, pgx.RowToStructByName[NamaUnit])
	if err != nil {
		log.Fatal("failed collecting tbl_select, " + err.Error())
	}
	defer rSelect.Close()

	if len(allRows) > 0 {
		if allRows[0].NamaUnit.String != "" {
			namaUnit = allRows[0].NamaUnit
		} else if allRows[0].NamaUnitLama.String != "" {
			namaUnit = allRows[0].NamaUnitLama
		}
	}

	return namaUnit
}
