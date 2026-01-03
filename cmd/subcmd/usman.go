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

		db.ConnectDbEsign()
		defer db.DbEsign.Close()

		db.ConnectVmsDb()
		defer db.VmsDb.Close()

		db.ConnectDbUsman()
		defer db.DbUsman.Close()

		db.ConnectProSippan()
		defer db.ProSippan.Close()

		db.ConnectDbSidapet()
		defer db.DbSidapet.Close()

		db.ConnectPromiseSibela()
		defer db.PromiseSibela.Close()

		// g.ExcludedEmails = ghelper.GetExcludedEmail()

		// usmanhelper.DropAllForeignKey()

		// usmanhelper.TruncateTableAndLog()
		usmanhelper.TruncateTableAndLog2()

		usman.MigrateUserInternal()
		usman.MigrateUserExternal()
		usman.PopulateTrxGroupUser()

		// // usman.PopulateHelperUserNip() ----
		usman.PopulateHelperUser()
		// usman.MigrateUserToUsman()
		// usman.UpdateUsmanRefUserIdOnHelperUser()

		// // usmanhelper.CreateAllForeignKey()

		usmanhelper.UpdatePkSequenceFromFile()

	},
}

func init() {
	// Emang Kosongz
}
