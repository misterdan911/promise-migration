package cmd

import (
	"github.com/spf13/cobra"
	"promise-migration/cmd/subcmd"
)

var MigrateCmd = &cobra.Command{
	Use:   "migrate [database]",
	Short: "A brief description of your command",
	Long: `A longer description that spans multiple lines and likely contains examples
and usage of using your command. For example:

Cobra is a CLI library for Go that empowers applications.
This application is a tool to generate the needed files
to quickly create a Cobra application.`,
}

func init() {

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// MigrateCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	//MigrateCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")

	//MigrateCmd.Flags().StringVarP(&parentName, "parent", "p", "rootCmd", "variable name of parent command for this command")

	MigrateCmd.AddCommand(subcmd.SippanCmd)
	MigrateCmd.AddCommand(subcmd.SidapetCmd)

}
