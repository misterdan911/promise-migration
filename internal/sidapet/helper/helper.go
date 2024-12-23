package helper

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"
)

func TruncateTable(tblName string) {
	qTruncate := "TRUNCATE TABLE " + tblName + " RESTART IDENTITY CASCADE"
	_, err := db.DbSidapet.Exec(context.Background(), qTruncate)
	if err != nil {
		log.Fatal("Truncate " + tblName + " Failed, " + err.Error())
	}

	fmt.Println(qTruncate)
}
