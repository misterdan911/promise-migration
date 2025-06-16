package usmanhelper

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
	_, err := db.DbUsman.Exec(context.Background(), qTruncate)
	if err != nil {
		log.Fatal("Truncate " + tblName + " Failed, " + err.Error())
	}

	fmt.Println(qTruncate)
}

func TruncatedbSidapetHelperUser() {
	qTruncate := "TRUNCATE TABLE helper_user RESTART IDENTITY"
	_, err := db.DbSidapet.Exec(context.Background(), qTruncate)
	if err != nil {
		log.Fatal("Truncate helper_user Failed, " + err.Error())
	}

	fmt.Println(qTruncate)
}

func TruncatedbSidapetHelperUserNip() {
	qTruncate := "TRUNCATE TABLE helper_user_nip RESTART IDENTITY"
	_, err := db.DbSidapet.Exec(context.Background(), qTruncate)
	if err != nil {
		log.Fatal("Truncate helper_user_nip Failed, " + err.Error())
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
		path = filepath.Join("files", "usman", "sql", "foreign_key_create.sql")
	} else if action == "drop" {
		path = filepath.Join("files", "sql", "foreign_key_drop.sql")
	} else {
		log.Fatal("Invalid action for AlterAllForeignKey")
	}

	data, err := os.ReadFile(path)
	if err != nil {
		log.Fatal("Error ReadFile: " + err.Error())
	}

	qFk := string(data)
	ctx := context.Background()
	_, errQFk := db.DbUsman.Exec(ctx, qFk)
	if errQFk != nil {
		//fmt.Println("qFk: " + qFk)
		log.Fatal("qFk Failed, action: " + action + ", " + errQFk.Error())
	}
}

func UpdatePkSequence(tableName string, pkFieldname string) {
	ctx := context.Background()

	seqName := tableName + "_" + pkFieldname + "_seq"
	qUpdateSeq := `SELECT setval('` + seqName + `', (SELECT MAX(` + pkFieldname + `) FROM ` + tableName + `))`
	_, errUpdateSeq := db.DbUsman.Exec(ctx, qUpdateSeq)
	if errUpdateSeq != nil {
		fmt.Println("unable to update " + seqName + ", " + errUpdateSeq.Error())
	}
}

func UpdatePkSequence2(tableName string, pkFieldname string, seqName string) {
	ctx := context.Background()

	qUpdateSeq := `SELECT setval('` + seqName + `', COALESCE((SELECT MAX(` + pkFieldname + `) FROM ref_user), 1))`;	
	fmt.Println(qUpdateSeq)
	_, errUpdateSeq := db.DbUsman.Exec(ctx, qUpdateSeq)
	if errUpdateSeq != nil {
		fmt.Println("unable to update " + seqName + ", " + errUpdateSeq.Error())
	}
}


func ResetSequence(seqName string) {
	ctx := context.Background()
	qUpdateSeq := `ALTER SEQUENCE ` + seqName + ` RESTART WITH 1`
	_, err := db.DbUsman.Exec(ctx, qUpdateSeq)
	if err != nil {
		fmt.Println("unable to ResetSequence: " + seqName + ", " + err.Error())
	}
}

type Lengthable interface {
	//~string | ~[]int | ~[]string
	~string | ~[]int
}

func GetLen[T Lengthable](myValue T) string {
	return " (" + strconv.Itoa(len(myValue)) + ")"
}
