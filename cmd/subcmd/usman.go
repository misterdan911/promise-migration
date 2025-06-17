package subcmd

import (
	"bufio"
	"log"
	"os"
	"path/filepath"
	"promise-migration/db"
	"promise-migration/internal/g"
	"promise-migration/internal/usman"
	"promise-migration/internal/usman/usmanhelper"
	"strings"

	"github.com/spf13/cobra"
)

var UsmanCmd = &cobra.Command{
	Use:   "usman",
	Short: "Migrasi user ke database Usman",
	Long:  `Perintah ini untuk melakukan migrasi user dari vms_db ke db_usman`,
	Run: func(cmd *cobra.Command, args []string) {

		db.ConnectVmsDb()
		defer db.VmsDb.Close()

		db.ConnectDbUsman()
		defer db.DbUsman.Close()

		db.ConnectDbSidapet()
		defer db.DbSidapet.Close()

		db.ConnectPromiseSibela()
		defer db.PromiseSibela.Close()

	  g.ExcludedEmails = getExcludedEmail()

		// usmanhelper.DropAllForeignKey()
		usmanhelper.TruncateTableAndLog()

		// usman.PopulateHelperUserNip()
		usman.PopulateHelperUser()
		usman.MigrateUserToUsman()

		// usmanhelper.CreateAllForeignKey()

	},
}

func getExcludedEmail() []string {
  var emails []string
  path := filepath.Join("files", "usman", "excluded_email.txt")

  // Open the file
  file, err := os.Open(path)
  if err != nil {
    log.Fatalf("Error opening file: %v", err)
  }
  defer file.Close()

  // Create a scanner to read the file line by line
  scanner := bufio.NewScanner(file)

  for scanner.Scan() {
    line := strings.TrimSpace(scanner.Text())

    // Skip empty lines
    if line == "" {
     continue
    }

    // Process the non-empty line
    emails = append(emails, line)
  }

  return emails
}


func init() {
	// Emang Kosongz
}

