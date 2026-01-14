package refkeluaranproseskontrakmodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type RefKeluaranProsesKontrak struct {
	KodeKeluaran     pgtype.Int4
	KodeProsesKontrak pgtype.Int4
	Keluaran         pgtype.Text
	Ucr              pgtype.Text
	Uch              pgtype.Text
	Udcr             pgtype.Timestamp
	Udch             pgtype.Timestamp
	StatusAktif      pgtype.Int2
}

func InsertNew(refKeluaranProsesKontrak RefKeluaranProsesKontrak) RefKeluaranProsesKontrak {
	ctx := context.Background()

	qInsert := `
	INSERT INTO ref_keluaran_proses_kontrak (
		kode_proses_kontrak,
		keluaran,
		ucr,
		uch,
		udcr,
		udch,
		status_aktif
	) VALUES (
		@kode_proses_kontrak,
		@keluaran,
		@ucr,
		@uch,
		@udcr,
		@udch,
		@status_aktif
	) RETURNING *`

	args := pgx.NamedArgs{
		"kode_proses_kontrak": refKeluaranProsesKontrak.KodeProsesKontrak,
		"keluaran":            refKeluaranProsesKontrak.Keluaran,
		"ucr":                 refKeluaranProsesKontrak.Ucr,
		"uch":                 refKeluaranProsesKontrak.Uch,
		"udcr":                refKeluaranProsesKontrak.Udcr,
		"udch":                refKeluaranProsesKontrak.Udch,
		"status_aktif":        refKeluaranProsesKontrak.StatusAktif,
	}

	rwIns, errIns := db.DbSiplang.Query(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert ref_keluaran_proses_kontrak, " + errIns.Error())
	}
	defer rwIns.Close()

	allRefKeluaranProsesKontrak, err := pgx.CollectRows(rwIns, pgx.RowToStructByName[RefKeluaranProsesKontrak])
	if err != nil {
		log.Fatal("failed collecting RefKeluaranProsesKontrak, " + err.Error())
	}

	return allRefKeluaranProsesKontrak[0]
}
