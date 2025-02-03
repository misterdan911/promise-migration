package rdomisilimodel

import (
	"context"

	"github.com/jackc/pgx/v5"
	"log"
	"promise-migration/db"
	"promise-migration/internal/sidapet/structs"
)

func GetMapDomisili() map[int32]string {
	ctx := context.Background()
	qDomisili := `SELECT kode_domisili, nama_domisili FROM ref_domisili`
	rwDomisili, err := db.DbSidapet.Query(ctx, qDomisili)
	if err != nil {
		log.Fatal("qDomisili Failed, " + err.Error() + " " + qDomisili)
	}
	allDomisili, err := pgx.CollectRows(rwDomisili, pgx.RowToStructByName[structs.RefDomisili])
	if err != nil {
		log.Fatal("failed collecting rwDomisili, " + err.Error())
	}
	defer rwDomisili.Close()

	mapDomisili := make(map[int32]string)
	for _, domisili := range allDomisili {
		mapDomisili[domisili.KodeDomisili.Int32] = domisili.NamaDomisili.String
	}
	return mapDomisili
}
