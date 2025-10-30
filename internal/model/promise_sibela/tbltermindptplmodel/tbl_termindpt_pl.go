package tbltermindptplmodel

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

	qSelect := `
	SELECT
		nama_termin,
		status_termin_dptbast AS status_termin_bast
	FROM tbl_termindpt_pl
	where id_paket_dptpl = $1
	ORDER BY id_termin_dptpl DESC
	LIMIT 1`

	rwData, err := db.PromiseSibela.Query(ctx, qSelect, idPaket)
	if err != nil {
		log.Fatal("qSelect Failed (tbl_termindpt_pl.go::GetLastStatusTerminBast), " + err.Error() + " " + qSelect)
	}

	allData, err2 := pgx.CollectRows(rwData, pgx.RowToStructByName[structs.StatusTerminBast])
	if err2 != nil {
		log.Fatal("failed collecting rwData (tbl_termindpt_pl.go::GetLastStatusTerminBast), " + err2.Error())
	}
	defer rwData.Close()

	var statusTerminBast pgtype.Int8

	if len(allData) > 0 {
		statusTerminBast = allData[0].StatusTerminBast
	}

	return statusTerminBast
}
