package subcmd

import (
  "fmt"

  "promise-migration/db"
  "promise-migration/internal/siqut"

  "github.com/spf13/cobra"
)

var SiqutCmd = &cobra.Command{
  Use:   "siqut",
  Short: "Migrasi database Si-Qut",
  Long:  `Perintah ini untuk melakukan migrasi database dari promise_siqut ke db_siqut`,
  Run: func(cmd *cobra.Command, args []string) {

		db.ConnectDbUsman()
		defer db.DbUsman.Close()

		db.ConnectDbSiqut()
		defer db.DbSiqut.Close()

    db.ConnectPromiseSiqut()
    defer db.PromiseSiqut.Close()

    fmt.Println("Truncating Siqut table and loggggggg...")
    siqut.TruncateTableAndLog()

    siqut.MigrateSiqut()

  },
}

