package helper

import (
	"fmt"
	"log"
	"os"
	"path/filepath"
	"promise-migration/internal/g"
	"strconv"
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

func LogUser(msg string) {

	// Check if folder exists, create if not
	fileName := strconv.Itoa(int(g.User.Id.Int32)) + "_" + g.User.Name.String + ".log"
	filePath := filepath.Join("logs", "users", fileName)

	// Create logs/user directory if it doesn't exist
	logDir := filepath.Dir(filePath)
	if _, err := os.Stat(logDir); os.IsNotExist(err) {
		err := os.MkdirAll(logDir, 0755)
		if err != nil {
			log.Printf("Failed to create log directory: %v\n", err)
			return
		}
	}

	// Open the file in append mode, create if not exists
	f, err := os.OpenFile(filePath, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if err != nil {
		log.Printf("Failed to open log file: %v\n", err)
		return
	}
	defer f.Close()

	// Write the log message with timestamp
	//timestamp := time.Now().Format("2006-01-02 15:04:05")
	logEntry := fmt.Sprintf("%s\n", msg)
	if _, err := f.WriteString(logEntry); err != nil {
		log.Printf("Failed to write to log file: %v\n", err)
	}
}

func DeleteFolder(path string) error {
	// Check if the path exists first
	info, err := os.Stat(path)
	if err != nil {
		if os.IsNotExist(err) {
			return nil // path doesn't exist, nothing to do
		}
		return err // some other error
	}

	// Make sure it's a directory
	if !info.IsDir() {
		return fmt.Errorf("%s is not a directory", path)
	}

	// Remove all contents first
	err = filepath.Walk(path, func(filePath string, info os.FileInfo, err error) error {
		if err != nil {
			return err
		}

		// Skip the root directory - we'll remove that last
		if filePath == path {
			return nil
		}

		// Remove the file or directory
		if info.IsDir() {
			return os.RemoveAll(filePath)
		}
		return os.Remove(filePath)
	})

	if err != nil {
		return fmt.Errorf("error removing contents: %v", err)
	}

	// Finally remove the now-empty directory
	return os.Remove(path)
}

func DeleteLogUserFolder() {
	path := filepath.Join("logs", "users")
	DeleteFolder(path)
}
