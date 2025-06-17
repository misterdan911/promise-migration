package sippanhelper

import (
	"context"
	"fmt"
	"promise-migration/db"
	"promise-migration/internal/g"
	"promise-migration/internal/model/dbsippan/refrupmodel"
	"promise-migration/internal/model/vmsdb/usermodel"
	"slices"
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

func TruncateTableAndLog() {

  // Hapus semua data di db_sippan.ref_rup kecuali ucr yg di exclude di file excluded_email.txt
  allVmsUser := usermodel.GetAllUser()
  for _, vmsUser := range allVmsUser {
    skipUser := slices.Contains(g.ExcludedEmails, vmsUser.Email.String)
    if skipUser {
     continue
    } else {
      refrupmodel.DeleteByUcr(vmsUser.Email);
    }
  }

  UpdatePkSequence("ref_rup", "kode_rup")
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

