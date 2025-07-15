package appdoc

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io"
	"mime/multipart"
	"net/http"
	"net/textproto" // This is the missing import
	"os"
	"path/filepath"
)

type ResponseServiceUpload struct {
  Code    int    `json:"code"`
  Status  string `json:"status"`
  Message string `json:"message"`
  Data    []struct {
    FileName string `json:"file_name"`
    Keypass  string `json:"keypass"`
  } `json:"data"`
}

var FilePath string = "D:/Danu/repo/golang/promise-migration/files/tmp/dokumen.pdf"

// downloadFile downloads a file from the specified URL and saves it to the given filepath
func DownloadFile(url string) (string, error) {

  fmt.Println("Url: " + url)

  // Create the directory if it doesn't exist
  dir := filepath.Dir(FilePath)
  if err := os.MkdirAll(dir, os.ModePerm); err != nil {
    return "", fmt.Errorf("failed to create directory: %v", err)
  }

  // Create the file
  out, err := os.Create(FilePath)
  if err != nil {
    return "", fmt.Errorf("failed to create file: %v", err)
  }
  defer out.Close()

  // Get the data
  resp, err := http.Get(url)
  if err != nil {
    return "", fmt.Errorf("failed to download file: %v", err)
  }
  defer resp.Body.Close()

  // Check server response
  if resp.StatusCode != http.StatusOK {
    return "", fmt.Errorf("bad status: %s", resp.Status)
  }

  // Write the body to file
  _, err = io.Copy(out, resp.Body)
  if err != nil {
    return "", fmt.Errorf("failed to write file: %v", err)
  }

  return FilePath, nil
}

func UploadFile(appName string, filePath string) (ResponseServiceUpload, error) {

  var successResp ResponseServiceUpload

  // Open the file to upload
  file, err := os.Open(filePath)
  if err != nil {
    return successResp, fmt.Errorf("failed to open file: %v", err)
  }
  defer file.Close()

  // Create a buffer to store our request body
  body := &bytes.Buffer{}
  writer := multipart.NewWriter(body)

  // Add the nama_aplikasi field
  err = writer.WriteField("nama_aplikasi", appName)
  if err != nil {
    return successResp, fmt.Errorf("failed to write nama_aplikasi field: %v", err)
  }

// Create a custom form file part with proper Content-Type
  part, err := writer.CreatePart(textproto.MIMEHeader{
    "Content-Disposition": []string{fmt.Sprintf(`form-data; name="%s"; filename="%s"`, "file", filepath.Base(filePath))},
    "Content-Type":        []string{"application/pdf"}, // Explicitly set PDF MIME type
  })
  if err != nil {
    return successResp, fmt.Errorf("failed to create form file: %v", err)
  }

  // Copy the file content to the form field
  _, err = io.Copy(part, file)
  if err != nil {
    return successResp, fmt.Errorf("failed to copy file content: %v", err)
  }

  // Close the multipart writer to finalize the body
  err = writer.Close()
  if err != nil {
    return successResp, fmt.Errorf("failed to close multipart writer: %v", err)
  }

  // Create the request
  urlServiceUpload := "http://localhost:4444/service-upload/api-auth/v1/uploads/pdf"
  req, err := http.NewRequest("POST", urlServiceUpload, body)
  if err != nil {
    return successResp, fmt.Errorf("failed to create request: %v", err)
  }

  // Set the content type header with the boundary
  req.Header.Set("Content-Type", writer.FormDataContentType())

  // Send the request
  client := &http.Client{}
  resp, err := client.Do(req)
  if err != nil {
    return successResp, fmt.Errorf("failed to send request: %v", err)
  }
  defer resp.Body.Close()

  // Check the response
  if resp.StatusCode != http.StatusOK {
    return successResp, fmt.Errorf("upload failed with status: %s", resp.Status)
  }

  // Read and print the response body
  respBody, err := io.ReadAll(resp.Body)
  if err != nil {
    return successResp, fmt.Errorf("failed to read response body: %v", err)
  }

  if err := json.Unmarshal(respBody, &successResp); err != nil {  // Parse []byte to the go struct pointer
    return successResp, fmt.Errorf("Can not unmarshal JSON: " + err.Error())
  }

  fmt.Printf("Upload successful! Response: %s\n", respBody)
  return successResp, nil
}

// deleteFile safely removes the specified file
func DeleteFile(filepath string) error {
  err := os.Remove(filepath)
  if err != nil {
    return fmt.Errorf("failed to delete file: %v", err)
  }
  return nil
}