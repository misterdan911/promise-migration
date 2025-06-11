package sibelahelper

import (
	"context"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"promise-migration/db"
	"strconv"
)

func TruncateTable(tblName string) {
	qTruncate := "TRUNCATE TABLE " + tblName + " RESTART IDENTITY"
	_, err := db.DbSibela.Exec(context.Background(), qTruncate)
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
		path = filepath.Join("files", "sibela", "sql", "foreign_key_create.sql")
	} else if action == "drop" {
		path = filepath.Join("files", "sibela", "sql", "foreign_key_drop.sql")
	} else {
		log.Fatal("Invalid action for AlterAllForeignKey")
	}

	data, err := os.ReadFile(path)
	if err != nil {
		log.Fatal("Error ReadFile: " + err.Error())
	}

	qFk := string(data)
	ctx := context.Background()
	_, errQFk := db.DbSibela.Exec(ctx, qFk)
	if errQFk != nil {
		//fmt.Println("qFk: " + qFk)
		log.Fatal("qFk Failed, action: " + action + ", " + errQFk.Error())
	}
}

func UpdatePkSequence(tableName string, pkFieldname string) {
	ctx := context.Background()

	seqName := tableName + "_" + pkFieldname + "_seq"
	qUpdateSeq := `SELECT setval('` + seqName + `', (SELECT MAX(` + pkFieldname + `) FROM ` + tableName + `))`
	_, errUpdateSeq := db.DbSibela.Exec(ctx, qUpdateSeq)
	if errUpdateSeq != nil {
		fmt.Println("unable to update " + seqName + ", " + errUpdateSeq.Error())
	}
}

type Lengthable interface {
	//~string | ~[]int | ~[]string
	~string | ~[]int
}

func GetLen[T Lengthable](myValue T) string {
	return " (" + strconv.Itoa(len(myValue)) + ")"
}
