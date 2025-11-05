package sippanhelper

import (
	"context"
	"fmt"
	"log"
	"os"
	"promise-migration/db"
	"strings"
	"path/filepath"
)

func UpdatePkSequence(tableName string, pkFieldname string) {
  ctx := context.Background()

  seqName := tableName + "_" + pkFieldname + "_seq"
  qUpdateSeq := `SELECT setval('` + seqName + `', (SELECT MAX(` + pkFieldname + `) FROM ` + tableName + `))`
  _, errUpdateSeq := db.DbSippan.Exec(ctx, qUpdateSeq)
  if errUpdateSeq != nil {
    fmt.Println("unable to update " + seqName + ", " + errUpdateSeq.Error())
  }
}

func GetUraianSpekKerja(uraian string, spesifikasi string) string {
  uraianSpek := ""
  uraian = strings.TrimSpace(uraian)
  spesifikasi = strings.TrimSpace(spesifikasi)

  if uraian == spesifikasi {
    uraianSpek = uraian
  } else {
    uraianSpek = uraian + " - " + spesifikasi
  }

  return uraianSpek
}

func ResetSequence(seqName string) {
	ctx := context.Background()
	qUpdateSeq := `ALTER SEQUENCE ` + seqName + ` RESTART WITH 1`
	_, err := db.DbSippan.Exec(ctx, qUpdateSeq)
	if err != nil {
		fmt.Println("unable to ResetSequence: " + seqName + ", " + err.Error())
	}
}


func UpdatePkSequenceFromFile() {

	var path string

	path = filepath.Join("files", "sippan", "sql", "update_serial_sequence.sql")

	data, err := os.ReadFile(path)
	if err != nil {
		log.Fatal("Error ReadFile: " + err.Error())
	}

	qFk := string(data)
	ctx := context.Background()
	_, errQFk := db.DbSippan.Exec(ctx, qFk)
	if errQFk != nil {
		log.Fatal("UpdatePkSequenceFromFile Failed, " + errQFk.Error())
	}
}
