package subcmd

import (
	"promise-migration/db"
	"promise-migration/internal/g"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/sidapet"
	"promise-migration/internal/sidapet/sidapethelper"

	"github.com/jackc/pgx/v5/pgtype"
	"github.com/spf13/cobra"
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

		sidapethelper.DropAllForeignKey()
		sidapethelper.TruncateTableAndLog()

		allHelperUser := helperusermodel.GetAllUser()

		for _, helperUser := range allHelperUser {
			g.User = g.GUser{
				Id:   helperUser.VmsUserId,
				Name: helperUser.VmsUserName,
			}

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

		sidapethelper.CreateAllForeignKey()

	},
}

func init() {
	// Emang Kosong
}
