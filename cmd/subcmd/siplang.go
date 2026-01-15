package subcmd

import (
	"fmt"
	"promise-migration/db"

	// "promise-migration/internal/g"
	// "promise-migration/internal/ghelper"
	"promise-migration/internal/siplang"

	"promise-migration/internal/siplang/siplanghelper"

	"github.com/spf13/cobra"
)

var SiplangCmd = &cobra.Command{
	Use:   "siplang",
	Short: "Migrasi database Si-PLang",
	Long:  `Perintah ini untuk melakukan migrasi database dari promise_siplang ke db_siplang`,
	Run: func(cmd *cobra.Command, args []string) {

		db.ConnectDbUsman()
		defer db.DbUsman.Close()

		db.ConnectVmsDb()
		defer db.VmsDb.Close()

		db.ConnectDbSidapet()
		defer db.DbSidapet.Close()

		// db.ConnectDbSibela()
		// defer db.DbSibela.Close()

		db.ConnectDbSiplang()
		defer db.DbSiplang.Close()

		db.ConnectDbSippan()
		defer db.DbSippan.Close()

		db.ConnectDbEsign()
		defer db.DbEsign.Close()

		db.ConnectPromiseSibela()
		defer db.PromiseSibela.Close()

		db.ConnectPromiseSiplang()
		defer db.PromiseSiplang.Close()

		db.ConnectProSippan()
		defer db.ProSippan.Close()

		fmt.Println("TruncateTableAndLog2")
		siplanghelper.TruncateTableAndLog2()

		fmt.Println("SetupVendorAccessForSiplang")
		siplang.SetupVendorAccessForSiplang()

		fmt.Println("InsertRefPermintaan")
		siplang.InsertRefPermintaan()

		siplang.InsertPenandatanganToSidapetRefVendorPenandatangan()

	},
}

func init() {
	// Emang Kosong
}
