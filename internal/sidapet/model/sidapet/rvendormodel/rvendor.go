package rvendormodel

import (
	"context"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
	"strconv"
)

type RefVendor struct {
	KodeVendor        pgtype.Int4
	KodeJenisVendor   pgtype.Int4
	NamaPerusahaan    pgtype.Text
	IsTetap           pgtype.Bool
	StatusFormLuarDpt pgtype.Text
	Udcr              pgtype.Timestamptz
	Udch              pgtype.Timestamptz
}

func GetVendorByKodeVendor(kodeVendor int) RefVendor {
	ctx := context.Background()

	var vendor RefVendor

	qVendor := `
    SELECT
      kode_vendor,
      kode_jenis_vendor,
      nama_perusahaan,
      is_tetap,
      status_form_luar_dpt,
      udcr,
      udch     
    FROM ref_vendor
    WHERE kode_vendor = $1`

	rVendor, errVendor := db.DbSidapet.Query(ctx, qVendor, strconv.Itoa(kodeVendor))
	if errVendor != nil {
		log.Fatal("qVendor Failed, " + errVendor.Error() + " " + qVendor)
	}

	allVendor, errCollect := pgx.CollectRows(rVendor, pgx.RowToStructByName[RefVendor])
	if errCollect != nil {
		log.Fatal("failed collecting allVendor, " + errCollect.Error())
	}
	defer rVendor.Close()

	if len(allVendor) > 0 {
		vendor = allVendor[0]
	}

	return vendor
}
