package cmd

import (
	"github.com/spf13/cobra"
	// "promise-migration/cmd/subcmd"
	"promise-migration/db"

)

var TesKoneksi = &cobra.Command{
	Use:   "teskoneksi [database]",
	Short: "Tes koneksi ke DB Postgres",
	Long: `Tes koneksi ke DB Postgres.`,
	Run: func(cmd *cobra.Command, args []string) {


		db.ConnectDbUsman()
		defer db.DbUsman.Close()

		db.ConnectDbEsign()
		defer db.DbEsign.Close()

		db.ConnectDbSippan()
		defer db.DbSippan.Close()

		db.ConnectDbSidapet()
		defer db.DbSidapet.Close()

		db.ConnectDbSibela()
		defer db.DbSibela.Close()


	},
}

func init() {

	// MigrateCmd.AddCommand(subcmd.DokumenCmd)

}
