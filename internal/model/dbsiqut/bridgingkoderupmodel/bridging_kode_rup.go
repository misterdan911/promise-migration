package bridgingkoderupmodel

import (
  "context"
  "log"

  "promise-migration/db"

  "github.com/jackc/pgx/v5"
  "github.com/jackc/pgx/v5/pgtype"
)

type BridgingKodeRup struct {
	IdRupUt pgtype.Int4
	KodeRup pgtype.Int4
}

func GetKodeRup(IdRup pgtype.Int4) pgtype.Int4 {
  ctx := context.Background()
  
  qSelect := `SELECT kode_rup FROM bridging_kode_rup WHERE id_rup_ut = $1`
  
  var kodeRup pgtype.Int4
  
  err := db.DbSiqut.QueryRow(ctx, qSelect, IdRup).Scan(&kodeRup)
  if err != nil {
    if err == pgx.ErrNoRows {
      // Return null/zero value if no record found
      return pgtype.Int4{Int32: 0, Valid: false}
    }
    log.Fatal("failed querying bridging_kode_rup (GetKodeRup), " + err.Error())
  }
  
  return kodeRup
}
