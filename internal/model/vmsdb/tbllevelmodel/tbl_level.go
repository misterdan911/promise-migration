package tbllevelmodel

import (
    "context"
    "log"

    "github.com/jackc/pgx/v5"
    "github.com/jackc/pgx/v5/pgtype"

    "promise-migration/db"
)

type TblLevel struct {
    IdLevel pgtype.Int4
    Level   string
}

func GetById(idLevel pgtype.Int4) TblLevel {
    var tblLevel TblLevel
    ctx := context.Background()

    qLevel := `
    SELECT
        id_level,
        level
    FROM tbl_level
    WHERE id_level = $1`

    rwLevel, err := db.VmsDb.Query(ctx, qLevel, idLevel)
    if err != nil {
        log.Fatal("qLevel Failed, " + err.Error() + " " + qLevel)
    }

    allLevel, err := pgx.CollectRows(rwLevel, pgx.RowToStructByName[TblLevel])
    if err != nil {
        log.Fatal("failed collecting rwLevel (tbllevelmodel.go:GetById), " + err.Error())
    }
    defer rwLevel.Close()

    if len(allLevel) > 0 {
        tblLevel = allLevel[0]
    }

    return tblLevel
}