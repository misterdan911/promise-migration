package siplang

import (
  "context"
  "fmt"
  "promise-migration/db"
)

func UpdateKodePermintaanMultiYears() {
  
  fmt.Println("Updating KodePermintaan MultiYears")

	ctx := context.Background()

	qUpdate := `
    UPDATE ref_permintaan SET kode_status_permintaan = 9
    WHERE kode_permintaan IN (1209, 1214, 1204, 1212)`

	_, err := db.DbSiplang.Exec(ctx, qUpdate)
	if err != nil {
		fmt.Println("unable to update status permintaan multiyears, " + err.Error())
	}

}