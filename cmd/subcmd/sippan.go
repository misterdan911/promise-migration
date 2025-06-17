/*
Copyright © 2024 NAME HERE <EMAIL ADDRESS>
*/
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
	Short: "A brief description of your command",
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

		db.ConnectDbSippan()
		defer db.DbSippan.Close()

    db.ConnectDbSidapet()
    defer db.DbSidapet.Close()

	  g.ExcludedEmails = ghelper.GetExcludedEmail()  

		sippanhelper.TruncateTableAndLog()
		sippan.MigrateTblRupUt()
		sippan.UpdateProvKabKota()
	},
}

func init() {

}
