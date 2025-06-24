package sippanhelper

import (
	"context"
	"fmt"
	"promise-migration/db"
	"strings"
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

