package subcmd

import (
	"github.com/jackc/pgx/v5/pgtype"
	"github.com/spf13/cobra"
	"promise-migration/db"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
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

		db.ConnectPromiseSibela()
		defer db.PromiseSibela.Close()

		helper.DropAllForeignKey()
		helper.TruncateTableAndLog()

		allHelperUser := helperusermodel.GetAllUser()

		//for user, _ := range allUser {
		//	sidapet.InsertToDbUsman(user)
		//}

		//sidapet.MigrateTblDomisili()

		for _, helperUser := range allHelperUser {

			if (helperUser.VmsUserLevel.Int32 == 5 || helperUser.VmsUserLevel.Int32 == 9) && (helperUser.DbPenyedia != pgtype.Text{}) {
				sidapet.MigrateTblProfilePenyedia(helperUser)
			} else {
				continue
			}

		}

		sidapet.MigrateTblPaket() // Belum di cek outputnya secara detail
		sidapet.MigrateTblPaketUndang()

		// Cari tahu trx_kategori.kode_unit_pbj
		sidapet.UpdateKodeTrxKategoriOnTrxPenjaringan()

		sidapet.MigrateTblVerif()

		helper.CreateAllForeignKey()

	},
}

func init() {
	// Emang Kosong
}
