package helper

import (
	"context"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"promise-migration/db"
)

func TruncateTable(tblName string) {
	qTruncate := "TRUNCATE TABLE " + tblName + " RESTART IDENTITY"
	_, err := db.DbSidapet.Exec(context.Background(), qTruncate)
	if err != nil {
		log.Fatal("Truncate " + tblName + " Failed, " + err.Error())
	}

	fmt.Println(qTruncate)
}

func DropAllForeignKey() {
	AlterAllForeignKey("drop")
}

func CreateAllForeignKey() {
	AlterAllForeignKey("create")
}

func AlterAllForeignKey(action string) {

	var path string

	if action == "create" {
		path = filepath.Join("files", "sidapet", "sql", "foreign_key_create.sql")
	} else if action == "drop" {
		path = filepath.Join("files", "sidapet", "sql", "foreign_key_drop.sql")
	} else {
		log.Fatal("Invalid action for AlterAllForeignKey")
	}

	data, err := os.ReadFile(path)
	if err != nil {
		log.Fatal(err)
	}

	qFk := string(data)
	ctx := context.Background()
	_, errQFk := db.DbSidapet.Exec(ctx, qFk)
	if errQFk != nil {
		log.Fatal("qFk Failed, action: " + action + ", " + err.Error())
	}
}
