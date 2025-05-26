package subcmd

import (
	"github.com/spf13/cobra"
	"promise-migration/db"
	"promise-migration/internal/usman"
	"promise-migration/internal/usman/helper"
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

		db.ConnectDbSidapet()
		defer db.DbSidapet.Close()

		helper.DropAllForeignKey()
		helper.TruncateTableAndLog()

		usman.MigrateVmsDbUser()

		helper.CreateAllForeignKey()

	},
}

func init() {
	// Emang Kosong
}
