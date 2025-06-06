package helper

import (
  "log"
  "os"
  "path/filepath"
)

func Log(fileName string, line string) {

  // Check if folder exists, create if not
  folderName := "logs"
  if _, err := os.Stat(folderName); os.IsNotExist(err) {
    if err := os.Mkdir(folderName, 0755); err != nil {
      log.Fatal("failed to create directory: " + err.Error())
      //return fmt.Errorf("failed to create directory: %v", err)
    }
  }

  // Open the file in append mode, create it if it doesn't exist
  filePath := filepath.Join(folderName, fileName)
  file, err := os.OpenFile(filePath, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
  if err != nil {
    log.Fatal("failed to open file: " + err.Error())
    //return fmt.Errorf("failed to open file: %v", err)
  }
  defer file.Close()

  // Write the line with a newline character
  if _, err := file.WriteString(line + "\n"); err != nil {
    log.Fatal("failed to write to file: " + err.Error())
    //return fmt.Errorf("failed to write to file: %v", err)
  }
}

func TruncateLog(fileName string) {
  folderName := "logs"
  filePath := filepath.Join(folderName, fileName)
  file, _ := os.OpenFile(filePath, os.O_WRONLY|os.O_TRUNC, 0644)
  defer file.Close()
}
