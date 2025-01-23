package subcmd

import (
	"github.com/spf13/cobra"
	"promise-migration/db"
	"promise-migration/internal/sidapet"
	"promise-migration/internal/sidapet/helper"
)

var SidapetCmd = &cobra.Command{
	Use:   "sidapet",
	Short: "Migrasi database Si-Dapet",
	Long:  `Perintah ini untuk melakukan migrasi database dari vms_db ke db_sidapet`,
	Run: func(cmd *cobra.Command, args []string) {

		db.ConnectVmsDb()
		defer db.VmsDb.Close()

		db.ConnectDbSidapet()
		defer db.DbSidapet.Close()

		helper.DropAllForeignKey()
		sidapet.MigrateTblPaket()
		sidapet.MigrateTblPaketUndang()
		sidapet.UpdateKodeTrxKategoriOnTrxPenjaringan()
		helper.CreateAllForeignKey()

	},
}

func init() {
	// Emang Kosong
}
