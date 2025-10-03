package ghelper

import (
	"bufio"
	"context"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"strconv"
	"strings"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"

	"promise-migration/db"
	"promise-migration/internal/g"
)

type VmsUserId struct {
	VmsUserId pgtype.Int4
}

func GetExcludedEmail() []string {
  var emails []string
  path := filepath.Join("files", "excluded_email", "email.txt")

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

func GetExcludedVmsUserId() []int32 {

	ctx := context.Background()
	var sliceUserId []int32

  // Create the IN clause part
	quotedEmails := make([]string, len(g.ExcludedEmails))
	for i, email := range g.ExcludedEmails {
		quotedEmails[i] = fmt.Sprintf("'%s'", email)
	}
	inClause := strings.Join(quotedEmails, ", ")
	
	// Generate the full query
	qHelperUser := fmt.Sprintf("SELECT vms_user_id FROM helper_user WHERE vms_user_email IN (%s)", inClause) 

	rwHelperUser, err := db.DbSidapet.Query(ctx, qHelperUser)
	if err != nil {
		log.Fatal("qHelperUser Failed, " + err.Error() + " " + qHelperUser)
	}

	allVmsUserId, err := pgx.CollectRows(rwHelperUser, pgx.RowToStructByName[VmsUserId])
	if err != nil {
		log.Fatal("failed collecting rwHelperUser (helper.go:GetExcludedVmsUserId), " + err.Error())
	}
	defer rwHelperUser.Close()

	for _, vmsUserId := range allVmsUserId {
		sliceUserId = append(sliceUserId, vmsUserId.VmsUserId.Int32)
	}

	return sliceUserId
} 

type Lengthable interface {
	//~string | ~[]int | ~[]string
	~string | ~[]int
}

func GetLen[T Lengthable](myValue T) string {
	return " (" + strconv.Itoa(len(myValue)) + ")"
}
