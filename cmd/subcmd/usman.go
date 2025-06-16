package subcmd

import (
	"promise-migration/db"
	"promise-migration/internal/usman"
	"promise-migration/internal/usman/usmanhelper"

	"github.com/spf13/cobra"
)

var UsmanCmd = &cobra.Command{
	Use:   "usman",
	Short: "Migrasi user ke database Usman",
	Long:  `Perintah ini untuk melakukan migrasi user dari vms_db ke db_usman`,
	Run: func(cmd *cobra.Command, args []string) {

		db.ConnectVmsDb()
		defer db.VmsDb.Close()

		db.ConnectDbUsman()
		defer db.DbUsman.Close()

		db.ConnectDbSidapet()
		defer db.DbSidapet.Close()

		db.ConnectPromiseSibela()
		defer db.PromiseSibela.Close()

		// usmanhelper.DropAllForeignKey()
		usmanhelper.TruncateTableAndLog()

		// usman.PopulateHelperUserNip()
		usman.PopulateHelperUser()
		usman.MigrateUserToUsman()

		// usmanhelper.CreateAllForeignKey()

	},
}

func init() {
	// Emang Kosongz
}
