package subcmd

import (
	"github.com/spf13/cobra"
	"promise-migration/db"
)

var SibelaCmd = &cobra.Command{
	Use:   "sibela",
	Short: "Migrasi database Si-Bela",
	Long:  `Perintah ini untuk melakukan migrasi database dari promise_sibela ke db_sibela`,
	Run: func(cmd *cobra.Command, args []string) {

		db.ConnectVmsDb()
		defer db.VmsDb.Close()

		db.ConnectDbSidapet()
		defer db.DbSidapet.Close()

		db.ConnectPromiseSibela()
		defer db.PromiseSibela.Close()

		//helper.DropAllForeignKey()
		//helper.TruncateTableAndLog()

		//helper.CreateAllForeignKey()

	},
}

func init() {
	// Emang Kosong
}
