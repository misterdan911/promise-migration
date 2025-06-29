package refvendormodel

import (
	"context"
	"log"

	"github.com/jackc/pgx/v5/pgtype"

	"promise-migration/db"
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


func DeleteByKodeVendor(kodeVendor pgtype.Int4) {
	ctx := context.Background()

	qDelete := `DELETE FROM ref_vendor WHERE kode_vendor = $1`
	_, err := db.DbSidapet.Exec(ctx, qDelete, kodeVendor)
	if err != nil {
		log.Fatal("failed deleting RefVendor (refvendor.go), " + err.Error())
	}
}
