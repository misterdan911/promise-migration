package subcmd

import (
  "promise-migration/db"
  "github.com/spf13/cobra"
)

var EsignCmd = &cobra.Command{
  Use:   "esign",
  Short: "Migrasi database E-Sign",
  Long:  `Perintah ini untuk melakukan migrasi database dari promise_esign ke db_esign`,
  Run: func(cmd *cobra.Command, args []string) {

		db.ConnectDbUsman()
		defer db.DbUsman.Close()

		db.ConnectDbEsign()
		defer db.DbEsign.Close()
  },
}

func init() {
  // Emang Kosong
}
