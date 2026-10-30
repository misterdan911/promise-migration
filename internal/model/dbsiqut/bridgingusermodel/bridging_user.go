package bridgingusermodel

import (
  "context"
  "log"

  "promise-migration/db"

  "github.com/jackc/pgx/v5"
  "github.com/jackc/pgx/v5/pgtype"
)

// type BridgingUser struct {
// }

func GetNama(IdUserV1 pgtype.Int4) pgtype.Text {
  ctx := context.Background()
  
  qSelect := `SELECT nama FROM bridging_user WHERE id_user_v1 = $1`
  
  var nama pgtype.Text
  
  err := db.DbSiqut.QueryRow(ctx, qSelect, IdUserV1).Scan(&nama)
  if err != nil {
    if err == pgx.ErrNoRows {
      // Return null/zero value if no record found
      return pgtype.Text{String: "", Valid: false}
    }
    log.Fatal("failed querying bridging_user (GetNama), " + err.Error())
  }
  
  return nama
}

