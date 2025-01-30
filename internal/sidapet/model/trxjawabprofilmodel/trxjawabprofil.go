package trxjawabprofilmodel

import (
	"context"

	"github.com/jackc/pgx/v5"
	"log"

	"promise-migration/db"
	"promise-migration/internal/sidapet/structs"
)

func InsertTrxJawabProfil(profilePenyedia structs.TblProfilePenyedia, mapJawabItem map[string]structs.JawabItem) {
  ctx := context.Background()

    for _, jawabItem := range mapJawabItem {
      // fmt.Println(key, jawabItem.Isian)

      qInsJawabProfil := `
      INSERT INTO trx_jawab_profil (kode_vendor, kode_item, isian)
      VALUES (
        @kode_vendor,
        @kode_item,
        @isian
      )`

      args := pgx.NamedArgs{
        "kode_vendor": profilePenyedia.IdProfilPenyedia,
        "kode_item": jawabItem.KodeItem,
        "isian": jawabItem.Isian,
      }

      _, errIns := db.DbSidapet.Exec(ctx, qInsJawabProfil, args)
      if errIns != nil {
        log.Fatal("unable to insert trx_jawab_profil, " + errIns.Error())
      }

    }
}
