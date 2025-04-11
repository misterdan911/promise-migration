package hdomisilimodel

import (
	"context"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
	"strconv"
)

type HDom struct {
	KodeKabKota pgtype.Text
}

func GetKodeKabKotaByKodeDomisili(kodeDom int32) string {
	ctx := context.Background()

	qHDom := `SELECT kode_kab_kota FROM helper_domisili WHERE kode_domisili = $1`
	rHDom, errHDom := db.DbSidapet.Query(ctx, qHDom, strconv.Itoa(int(kodeDom)))
	if errHDom != nil {
		log.Fatal("qHDom Failed, " + errHDom.Error() + " " + qHDom)
	}

	allHDom, errCollect := pgx.CollectRows(rHDom, pgx.RowToStructByName[HDom])
	if errCollect != nil {
		log.Fatal("failed collecting rows, " + errCollect.Error())
	}
	defer rHDom.Close()

	return allHDom[0].KodeKabKota.String
}
