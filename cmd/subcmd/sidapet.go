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

		/*
			path := filepath.Join("files", "sidapet", "sql", "foreign_key_create.sql")
			data, err := os.ReadFile(path)
			if err != nil {
				log.Fatal(err)
			}

			qAddFk := string(data)
			ctx := context.Background()
			_, errQAddFk := db.DbSidapet.Exec(ctx, qAddFk)
			if errQAddFk != nil {
				log.Fatal("qAddFk Failed, " + err.Error())
			}
		*/

		helper.DropAllForeignKey()

		sidapet.MigrateTblPaket()
		//sidapet.MigrateTblPaketUndang()
		//sidapet.UpdateKodeTrxKategoriOnTrxPenjaringan()

		helper.CreateAllForeignKey()

	},
}

func init() {
	// Emang Kosong
}
