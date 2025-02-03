package trxjawabitemmodel


import (
	"context"

	"github.com/jackc/pgx/v5"
	"log"

	"promise-migration/db"
	"promise-migration/internal/sidapet/structs"
)

func InsertTrxJawabItem(profilePenyedia structs.TblProfilePenyedia, mapJawabItem map[string]structs.JawabItem) {
	ctx := context.Background()

  for _, jawabItem := range mapJawabItem {

    qInsJawabProfil := `
      INSERT INTO trx_jawab_item (kode_vendor, kode_item, kode_paket, isian)
      VALUES (
        @kode_vendor,
        @kode_item,
        @kode_trx_kategori,
        @isian
      )`

    args := pgx.NamedArgs{
      "kode_vendor": profilePenyedia.IdProfilPenyedia,
      "kode_item":   jawabItem.KodeItem,
      "kode_trx_kategori":  profilePenyedia.IdPaket,
      "isian":       jawabItem.Isian,
    }

    _, errIns := db.DbSidapet.Exec(ctx, qInsJawabProfil, args)
    if errIns != nil {
      log.Fatal("unable to insert trx_jawab_profil, " + errIns.Error())
    }

  }
}
