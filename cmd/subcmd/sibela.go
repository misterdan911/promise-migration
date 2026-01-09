package subcmd

import (
	"promise-migration/db"
	// "promise-migration/internal/g"
	// "promise-migration/internal/ghelper"
	"promise-migration/internal/sibela"
	"promise-migration/internal/sibela/sibelahelper"

	"github.com/spf13/cobra"
)

var SibelaCmd = &cobra.Command{
	Use:   "sibela",
	Short: "Migrasi database Si-Bela",
	Long:  `Perintah ini untuk melakukan migrasi database dari promise_sibela ke db_sibela`,
	Run: func(cmd *cobra.Command, args []string) {

		db.ConnectDbUsman()
		defer db.DbUsman.Close()

		db.ConnectVmsDb()
		defer db.VmsDb.Close()

		db.ConnectDbSidapet()
		defer db.DbSidapet.Close()

		db.ConnectDbSibela()
		defer db.DbSibela.Close()

		db.ConnectDbSippan()
		defer db.DbSippan.Close()

		db.ConnectDbEsign()
		defer db.DbEsign.Close()

		db.ConnectPromiseSibela()
		defer db.PromiseSibela.Close()

		db.ConnectProSippan()
		defer db.ProSippan.Close()


		// sibelahelper.DropAllForeignKey()

		// g.ExcludedEmails = ghelper.GetExcludedEmail2("email.txt")

		sibelahelper.TruncateTableAndLog2()
		sibela.SetupVendorAccessForSibela()
		sibela.InsertRefPermintaan()

		// sibela.InsertPenandatanganToSidapetRefVendorPenandatangan()

		// sibelahelper.CreateAllForeignKey()
	},
}

func init() {
	// Emang Kosong
}
