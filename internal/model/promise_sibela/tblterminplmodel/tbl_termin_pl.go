package tblterminplmodel

import (
	"context"
	"log"
	"promise-migration/db"
	"promise-migration/internal/sibela/structs"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

func GetLastStatusTerminBast(idPaket pgtype.Int4) pgtype.Int8 {
	ctx := context.Background()
	qSelect := `SELECT nama_termin, status_termin_bast FROM tbl_termin_pl where id_paket_pl = $1 order by id_termin_pl desc limit 1`
	rwData, err := db.PromiseSibela.Query(ctx, qSelect, idPaket)
	if err != nil {
		log.Fatal("qSelect Failed, " + err.Error() + " " + qSelect)
	}

	allData, err2 := pgx.CollectRows(rwData, pgx.RowToStructByName[structs.StatusTerminBast])
	if err2 != nil {
		log.Fatal("failed collecting rwData (tbl_termin_pl.go), " + err2.Error())
	}
	defer rwData.Close()

	var statusTerminBast pgtype.Int8

	if len(allData) > 0 {
		statusTerminBast = allData[0].StatusTerminBast
	}

	return statusTerminBast
}
