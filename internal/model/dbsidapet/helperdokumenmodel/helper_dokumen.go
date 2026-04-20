package helperdokumenmodel

import (
	"context"
  "fmt"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type HelperDokumen struct {
  KodeHelper pgtype.Int4
	AppName pgtype.Text
  OriginalPath pgtype.Text
  Newfilename pgtype.Text
  EncryptKey pgtype.Text
}

func InsertNew(helperDokumen HelperDokumen) {
  ctx := context.Background()

  qInsert := `
  INSERT INTO helper_dokumen (
    app_name,
    original_path,
    newfilename,
    encrypt_key
  ) VALUES (
    @app_name,
    @original_path,
    @newfilename,
    @encrypt_key
  )`

  args := pgx.NamedArgs{
    "app_name": helperDokumen.AppName,
    "original_path": helperDokumen.OriginalPath,
    "newfilename":   helperDokumen.Newfilename,
    "encrypt_key":   helperDokumen.EncryptKey,
  }

  _, errIns := db.DbSidapet.Exec(ctx, qInsert, args)
  if errIns != nil {
    log.Fatal("unable to insert helper_dokumen (helper_dokumen.go:InsertNew), " + errIns.Error())
  }
}

func GetByOriginalPath(originalPath pgtype.Text) HelperDokumen {
  var helperDokumen HelperDokumen
  ctx := context.Background()

  qDokumen := `
  SELECT
    kode_helper,
    app_name,
    original_path,
    newfilename,
    encrypt_key
  FROM helper_dokumen hd
  WHERE original_path = $1`

  qDokumen2 := `
  SELECT
    kode_helper,
    app_name,
    original_path,
    newfilename,
    encrypt_key
  FROM helper_dokumen hd
  WHERE original_path = '` + originalPath.String + `'`

  fmt.Println(qDokumen2);


  rwDokumen, err := db.DbSidapet.Query(ctx, qDokumen, originalPath)
  if err != nil {
    log.Fatal("qDokumen Failed, " + err.Error() + " " + qDokumen)
  }

  allDokumen, err := pgx.CollectRows(rwDokumen, pgx.RowToStructByName[HelperDokumen])
  if err != nil {
    log.Fatal("failed collecting rwDokumen (helper_dokumen.go:GetByOriginalPath), " + err.Error())
  }
  defer rwDokumen.Close()

  if len(allDokumen) > 0 {
    helperDokumen = allDokumen[0]
  }

  return helperDokumen
}
