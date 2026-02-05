package subcmd

import (
	"fmt"
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


    /*
     * Kosongkan tabel berikut ini:
     * - ref_user
     * - ref_user_internal
     * - ref_user_external
     * - trx_user_tampung
     * - trx_group_user
     * - db_sidapet.helper_user
    */	
	usmanhelper.TruncateTableAndLog2()

	usman.MigrateUserInternal()
	usman.MigrateUserExternal()

	usman.SetupVendorAccessForSidapet()
	usman.SetupAccessForInternalUser()

	usman.PopulateHelperUser()

	usmanhelper.UpdatePkSequenceFromFile()

	fmt.Println("WARNING: Cek lagi tabel ref_aplikasi, karena path file2 nya berbeda antara devel dan production");

	},
}

func init() {
	// Emang Kosongz
}


// gak dipake
// g.ExcludedEmails = ghelper.GetExcludedEmail()

// usmanhelper.DropAllForeignKey()

// usmanhelper.TruncateTableAndLog()

// usman.PopulateTrxGroupUser()


// // usman.PopulateHelperUserNip() ----
// usman.MigrateUserToUsman()
// usman.UpdateUsmanRefUserIdOnHelperUser()
// // usmanhelper.CreateAllForeignKey()

