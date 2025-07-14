package subcmd

import (
	"promise-migration/db"
	"promise-migration/internal/appdoc"

	"github.com/spf13/cobra"
)

var AppDocCmd = &cobra.Command{
  Use:   "appdoc",
  Short: "Migrasi semua file dan dokumen fisik",
  Long:  `Perintah ini untuk melakukan migrasi semua file dan dokumen fisik`,
  Run: func(cmd *cobra.Command, args []string) {

    db.ConnectVmsDb()
    defer db.VmsDb.Close()

   appdoc.MigrateFileFromVmsDbTblProfile()

  },
}

func init() {
  // Emang Kosongz
}
