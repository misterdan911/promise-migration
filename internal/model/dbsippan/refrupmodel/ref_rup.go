package refrupmodel

import (
	"context"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5/pgtype"
)

func DeleteByUcr(email pgtype.Text) {

  ctx := context.Background()

  qDelete := `DELETE FROM ref_rup WHERE ucr = $1`
  _, err := db.DbSippan.Exec(ctx, qDelete, email)
  if err != nil {
    log.Fatal("failed deleting RefRup (ref_rup.go), " + err.Error())
  }

}