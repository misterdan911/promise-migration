package subcmd

import (
	"github.com/spf13/cobra"
	"promise-migration/db"
)

var UsmanCmd = &cobra.Command{
	Use:   "usman",
	Short: "Migrasi database Usman",
	Long:  `Perintah ini untuk melakukan migrasi database dari vms_db ke db_usman`,
	Run: func(cmd *cobra.Command, args []string) {

		db.ConnectVmsDb()
		defer db.VmsDb.Close()

		db.ConnectDbUsman()
		defer db.DbUsman.Close()

		//helper.DropAllForeignKey()
		//helper.TruncateTableAndLog()
		//
		//sidapet.MigrateTblProfilePenyedia()
		//
		//helper.CreateAllForeignKey()

	},
}

func init() {
	// Emang Kosong
}
