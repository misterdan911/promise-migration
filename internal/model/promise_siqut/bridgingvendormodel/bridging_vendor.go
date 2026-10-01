package bridgingvendormodel

import (
	"context"
	"log"

	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

func GetKodeVendorByV1UserId(v1UserId pgtype.Int4) pgtype.Int4 {

	ctx := context.Background()

	var kodeVendor pgtype.Int4

	qAllData := `
	SELECT
	rue.id AS kode_vendor
	FROM vms_db.users vu
	LEFT JOIN db_usman.ref_user ru ON LOWER(ru.email) = LOWER(vu.email)
	LEFT JOIN db_usman.ref_user_external rue ON rue.id_user = ru.id
	WHERE vu.id = $1`

	err := db.PromiseSiqut.QueryRow(ctx, qAllData, v1UserId).Scan(&kodeVendor)

  if err != nil {
    if err == pgx.ErrNoRows {
      return pgtype.Int4{Valid: false}
    }
    log.Fatal("failed querying GetKodeVendorByV1UserId, " + err.Error())
  }

	return kodeVendor
}



