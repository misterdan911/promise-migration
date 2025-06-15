package subcmd

import (
	"promise-migration/db"
	"promise-migration/internal/sibela"
	"promise-migration/internal/sibela/sibelahelper"

	"github.com/spf13/cobra"
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

		db.ConnectDbSibela()
		defer db.DbSibela.Close()

		db.ConnectPromiseSibela()
		defer db.PromiseSibela.Close()

		sibelahelper.DropAllForeignKey()
		sibelahelper.TruncateTableAndLog()

		/*
		 ISSUE:
		 - Tabel ref_permintaan
		   kode_unit masih ada yg null karena id_ppk dan id_userpp dua2 nya null
		*/
		sibela.InsertRefPermintaan()

		// sibelahelper.CreateAllForeignKey()
	},
}

func init() {
	// Emang Kosong
}
