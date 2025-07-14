package subcmd

import (
	"promise-migration/db"
	"promise-migration/internal/g"
	"promise-migration/internal/ghelper"
	"promise-migration/internal/sippan"
	"promise-migration/internal/sippan/sippanhelper"

	"github.com/spf13/cobra"
)

var SippanCmd = &cobra.Command{
  Use:   "sippan",
  Short: "Migrasi database Si-PPan",
  Long: `A longer description that spans multiple lines and likely contains examples
  and usage of using your command. For example:

  Cobra is a CLI library for Go that empowers applications.
  This application is a tool to generate the needed files
  to quickly create a Cobra application.`,
  Run: func(cmd *cobra.Command, args []string) {

    db.ConnectVmsDb()
    defer db.VmsDb.Close()

    db.ConnectProSippan()
    defer db.ProSippan.Close()

    db.ConnectDbUsman()
    defer db.DbUsman.Close()

    db.ConnectDbSippan()
    defer db.DbSippan.Close()

    db.ConnectDbSidapet()
    defer db.DbSidapet.Close()

    g.ExcludedEmails = ghelper.GetExcludedEmail()
    g.ExcludedVmsUserId = ghelper.GetExcludedVmsUserId()

    sippanhelper.TruncateTableAndLog()
    sippan.MigrateTblRupUt()
    sippan.UpdateProvKabKota()
  },
}

func init() {

}
