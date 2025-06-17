package ghelper

import (
	"bufio"
	"log"
	"os"
	"path/filepath"
	"strings"
)

func GetExcludedEmail() []string {
  var emails []string
  path := filepath.Join("files", "excluded_email.txt")

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
