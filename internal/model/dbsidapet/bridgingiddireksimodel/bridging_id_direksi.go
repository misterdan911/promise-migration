package bridgingiddireksimodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type BridgingIdDireksi struct {
	KodeBridging   pgtype.Int4
	IdDireksiPerus pgtype.Int4
	DptPenyedia    pgtype.Text
	KodeDireksi    pgtype.Int4
	JbtnDireksi    pgtype.Text
}

func InsertNew(bridgingIdDireksi BridgingIdDireksi) BridgingIdDireksi {
	ctx := context.Background()

	qInsert := `
	INSERT INTO bridging_id_direksi (
		id_direksi_perus,
		dpt_penyedia,
		kode_direksi,
		jbtn_direksi
	) VALUES (
		@id_direksi_perus,
		@dpt_penyedia,
		@kode_direksi,
		@jbtn_direksi
	) RETURNING *`

	args := pgx.NamedArgs{
		"id_direksi_perus": bridgingIdDireksi.IdDireksiPerus,
		"dpt_penyedia":    bridgingIdDireksi.DptPenyedia,
		"kode_direksi":    bridgingIdDireksi.KodeDireksi,
		"jbtn_direksi":    bridgingIdDireksi.JbtnDireksi,
	}

	rwIns, errIns := db.DbSidapet.Query(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert bridging_id_direksi, " + errIns.Error())
	}
	defer rwIns.Close()

	allBridgingIdDireksi, err := pgx.CollectRows(rwIns, pgx.RowToStructByName[BridgingIdDireksi])
	if err != nil {
		log.Fatal("failed collecting BridgingIdDireksi, " + err.Error())
	}

	return allBridgingIdDireksi[0]
}
