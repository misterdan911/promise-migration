package subcmd

import (
	"fmt"
	"promise-migration/db"
	// "promise-migration/internal/g"
	// "promise-migration/internal/ghelper"
	"promise-migration/internal/sibela"
	"promise-migration/internal/sibela/sibelahelper"

	"github.com/spf13/cobra"
)

var SiplangCmd = &cobra.Command{
	Use:   "sibela",
	Short: "Migrasi database Si-Plang",
	Long:  `Perintah ini untuk melakukan migrasi database dari promise_siplang ke db_siplang`,
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

		fmt.Println("TruncateTableAndLog2")
		sibelahelper.TruncateTableAndLog2()
		
		fmt.Println("SetupVendorAccessForSibela")
		sibela.SetupVendorAccessForSibela()

		fmt.Println("InsertRefPermintaan")
		sibela.InsertRefPermintaan()

		// sibela.InsertPenandatanganToSidapetRefVendorPenandatangan()

		// sibelahelper.CreateAllForeignKey()
	},
}

func init() {
	// Emang Kosong
}
