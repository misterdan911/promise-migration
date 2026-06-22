package siqut

import (
	"context"
	"log"
	"os"
	"path/filepath"
	
	"promise-migration/db"
)


func TruncateTableAndLog() {
	ctx := context.Background()

	qTruncate := "TRUNCATE TABLE ref_perencanaan CASCADE"
	_, err := db.DbSiqut.Exec(ctx, qTruncate)
	if err != nil {
		log.Fatal("Truncate ref_perencanaan Failed, " + err.Error())
	}
	
	// UpdatePrimaryKeySequenceFromFile()
}

func UpdatePrimaryKeySequenceFromFile() {

	var path string

	path = filepath.Join("files", "siqut", "sql", "update_serial_sequence.sql")

	data, err := os.ReadFile(path)
	if err != nil {
		log.Fatal("Error ReadFile: " + err.Error())
	}

	qFk := string(data)
	ctx := context.Background()
	_, errQFk := db.DbSiqut.Exec(ctx, qFk)
	if errQFk != nil {
		log.Fatal("Siqut UpdatePkSequenceFromFile Failed, " + errQFk.Error())
	}
}
