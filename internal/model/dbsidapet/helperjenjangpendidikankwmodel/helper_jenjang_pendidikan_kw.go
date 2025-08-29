package helperjenjangpendidikankwmodel

import (
	"context"
  "log"

  "promise-migration/db"


  "github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type HelperJenjangPendidikanKw struct {
	Keyword pgtype.Text
  JenjangPendidikan pgtype.Text
	KodeJenjangPendidikan pgtype.Int4
}

func GetAllData() []HelperJenjangPendidikanKw {

  ctx := context.Background()

  qAllData := `
  SELECT
  hjpk.jenjang_pendidikan,
  keyword,
  kode_jenjang_pendidikan
  FROM helper_jenjang_pendidikan_kw hjpk
  LEFT JOIN ref_jenjang_pendidikan rjp ON rjp.jenjang_pendidikan = hjpk.jenjang_pendidikan
  ORDER BY "id"
  `

  rwHelper, errHelper := db.DbSidapet.Query(ctx, qAllData)
  if errHelper != nil {
    log.Fatal("qAllData Failed, " + errHelper.Error() + " " + qAllData)
  }

  allData, errCollect := pgx.CollectRows(rwHelper, pgx.RowToStructByName[HelperJenjangPendidikanKw])
  if errCollect != nil {
    log.Fatal("failed collecting rows, " + errCollect.Error())
  }
  defer rwHelper.Close()

  return allData
}