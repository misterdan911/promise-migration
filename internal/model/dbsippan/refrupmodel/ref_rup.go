package refrupmodel

import (
	"context"
	"log"
	// "fmt"
	// "os"
	"strings"
	"promise-migration/db"

	"github.com/jackc/pgx/v5/pgtype"
)

type KodeNoRup struct {
	KodeRup pgtype.Int4
	NoRup   pgtype.Text
}

func DeleteByUcr(email pgtype.Text) {

  ctx := context.Background()

  qDelete := `DELETE FROM ref_rup WHERE ucr = $1`
  _, err := db.DbSippan.Exec(ctx, qDelete, email)
  if err != nil {
    log.Fatal("failed deleting RefRup (ref_rup.go), " + err.Error())
  }

}

func GetKodeRupByNoRup(noRup pgtype.Text) pgtype.Int4 {

	ctx := context.Background()
	noRup.String = strings.TrimSpace(noRup.String)
	qSelect := `
	SELECT 
		kode_rup,
		no_rup
	FROM 
		ref_rup
	WHERE 
		no_rup = $1
	`
	var kodeNoRup KodeNoRup

	err := db.DbSippan.QueryRow(ctx, qSelect, noRup).Scan(
		&kodeNoRup.KodeRup,
		&kodeNoRup.NoRup,
	)
	if err != nil {
		// fmt.Fprintf(os.Stderr, "GetKodeRupByNoRup return null value: %v\n", err)
		return pgtype.Int4{}
	}

	return kodeNoRup.KodeRup
}


func UpdateNoDrauk(kodeRup pgtype.Int4, noDrauk pgtype.Int4) {

	ctx := context.Background()

	qUpdate := `UPDATE ref_rup SET no_drauk = $1 WHERE kode_rup = $2`
  _, err := db.DbSippan.Exec(ctx, qUpdate, noDrauk, kodeRup)

  if err != nil {
    log.Fatal("failed updating RefRup (ref_rup.go), " + err.Error())
  }
}

