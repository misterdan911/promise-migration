package appdoc

import (
	"bytes"
	"crypto/tls"
	"encoding/json"
	"fmt"
	"io"
	"mime/multipart"
	"net/http"
	"net/textproto" // This is the missing import
	"os"
	"path/filepath"
	"strings"

	// "log"

	"promise-migration/internal/g"
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

type ResponseServiceUploadMix struct {
	Code    int    `json:"code"`
	Status  string `json:"status"`
	Message string `json:"message"`
	Data    struct {
		Total  int `json:"total"`
		Images int `json:"images"`
		PDFs   int `json:"pdfs"`
		Files  []struct {
			FileName string      `json:"file_name"`
			FileType string      `json:"file_type"`
			Keypass  interface{} `json:"keypass"` // Use interface{} since it can be null
		} `json:"files"`
	} `json:"data"`
}

// var FilePath string = "D:/Danu/repo/golang/promise-migration/files/tmp/dokumen.pdf"

func DownloadFile(url string) error {
	// Create the directory if it doesn't exist
	dir := filepath.Dir(g.FilePath)
	if err := os.MkdirAll(dir, os.ModePerm); err != nil {
		return fmt.Errorf("failed to create directory: %v", err)
	}

	// Create the file
	g.PathPlusFilename = g.FilePath + "/" + g.FileNameEncoded
	out, err := os.Create(g.PathPlusFilename)
	if err != nil {
		// kalau nama filenya kepanjangan
		if strings.Contains(err.Error(), "The filename, directory name, or volume label syntax is incorrect") {

			fmt.Println("Masuk siniiiiiiiiiiiiiiiiiiiiiiiiiiiiii")

			// coba lagi dengan nama file yg lebih pendek
			g.PathPlusFilename = g.FilePath + "/" + "tmp" + g.FileExt
			fmt.Println("g.PathPlusFilename: ", g.PathPlusFilename)

			// log.Fatal("Stoppppppppppppp")

			out, err = os.Create(g.PathPlusFilename)
			if err != nil {
				return fmt.Errorf("failed to create file: %v", err)
			}
		}
	}
	defer out.Close()

	// Get the data
	resp, err := http.Get(url)
	if err != nil {

		if strings.Contains(err.Error(), "invalid pdf header") {
		}

		return fmt.Errorf("failed to download file: %v", err)
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		return fmt.Errorf("bad status: %s", resp.Status)
	}

	// Write the body to file
	_, err = io.Copy(out, resp.Body)
	if err != nil {
		return fmt.Errorf("failed to write file: %v", err)
	}

	return nil
}

func UploadFilePdf(appName string, filePath string) (ResponseServiceUpload, error) {

	var successResp ResponseServiceUpload

	// Open the file to upload
	file, err := os.Open(filePath)
	if err != nil {
		return successResp, fmt.Errorf("failed to open file - UploadFilePdf: %v", err)
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
	urlServiceUpload := os.Getenv("URL_SERVICE_UPLOAD") + "/" + "pdf"
	req, err := http.NewRequest("POST", urlServiceUpload, body)
	if err != nil {
		return successResp, fmt.Errorf("failed to create request: %v", err)
	}

	// Set the content type header with the boundary
	req.Header.Set("Content-Type", writer.FormDataContentType())

	// Create a custom transport that skips TLS verification
	tr := &http.Transport{
		TLSClientConfig: &tls.Config{InsecureSkipVerify: true},
	}

	// Send the request
	client := &http.Client{Transport: tr}
	resp, err := client.Do(req)
	if err != nil {
		return successResp, fmt.Errorf("failed to send request: %v", err)
	}
	defer resp.Body.Close()

	// Read and print the response body
	respBody, err := io.ReadAll(resp.Body)
	if err != nil {
		return successResp, fmt.Errorf("failed to read response body: %v", err)
	}

	if err := json.Unmarshal(respBody, &successResp); err != nil { // Parse []byte to the go struct pointer
		return successResp, fmt.Errorf("Can not unmarshal JSON: " + err.Error())
	}

	// Check the response
	if resp.StatusCode != http.StatusOK {
		// fmt.Println("Upload failed! Response: ", successResp.Message)
		return successResp, fmt.Errorf("upload failed with status: %s, %s", resp.Status, successResp.Message)
	}

	// fmt.Printf("Upload successful! Response: %s\n", respBody)
	return successResp, nil
}

func UploadFileExcel(appName string, filePath string) (ResponseServiceUpload, error) {

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

	part, err := writer.CreatePart(textproto.MIMEHeader{
		"Content-Disposition": []string{fmt.Sprintf(`form-data; name="%s"; filename="%s"`, "file", filepath.Base(filePath))},
		"Content-Type":        []string{"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"}, // Explicitly set PDF MIME type
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
	urlServiceUpload := os.Getenv("URL_SERVICE_UPLOAD") + "/" + "excel"
	req, err := http.NewRequest("POST", urlServiceUpload, body)
	if err != nil {
		return successResp, fmt.Errorf("failed to create request: %v", err)
	}

	// fmt.Println(req)

	// Set the content type header with the boundary
	req.Header.Set("Content-Type", writer.FormDataContentType())

	// Create a custom transport that skips TLS verification
	tr := &http.Transport{
		TLSClientConfig: &tls.Config{InsecureSkipVerify: true},
	}

	// Send the request
	client := &http.Client{Transport: tr}
	resp, err := client.Do(req)
	if err != nil {
		return successResp, fmt.Errorf("failed to send request: %v", err)
	}
	defer resp.Body.Close()

	// Read and print the response body
	respBody, err := io.ReadAll(resp.Body)
	if err != nil {
		return successResp, fmt.Errorf("failed to read response body: %v", err)
	}

	if err := json.Unmarshal(respBody, &successResp); err != nil { // Parse []byte to the go struct pointer
		return successResp, fmt.Errorf("Can not unmarshal JSON: " + err.Error())
	}

	// Check the response
	if resp.StatusCode != http.StatusOK {
		// fmt.Println("Upload failed! Response: ", successResp.Message)
		return successResp, fmt.Errorf("upload failed with status: %s, %s", resp.Status, successResp.Message)
	}

	// fmt.Printf("Upload successful! Response: %s\n", respBody)
	return successResp, nil
}

func UploadFileImage(appName string, filePath string) (ResponseServiceUpload, error) {

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

	var contentType []string

	switch g.FileExt {
	case ".jpeg", ".jpg":
		contentType = []string{"image/jpeg"}
	case ".png":
		contentType = []string{"image/png"}
	}

	part, err := writer.CreatePart(textproto.MIMEHeader{
		"Content-Disposition": []string{fmt.Sprintf(`form-data; name="%s"; filename="%s"`, "file", filepath.Base(filePath))},
		"Content-Type":        contentType, // Explicitly set PDF MIME type
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
	urlServiceUpload := os.Getenv("URL_SERVICE_UPLOAD") + "/" + "image"
	req, err := http.NewRequest("POST", urlServiceUpload, body)
	if err != nil {
		return successResp, fmt.Errorf("failed to create request: %v", err)
	}

	// fmt.Println(req)

	// Set the content type header with the boundary
	req.Header.Set("Content-Type", writer.FormDataContentType())

	// Create a custom transport that skips TLS verification
	tr := &http.Transport{
		TLSClientConfig: &tls.Config{InsecureSkipVerify: true},
	}

	// Send the request
	client := &http.Client{Transport: tr}
	resp, err := client.Do(req)
	if err != nil {
		return successResp, fmt.Errorf("failed to send request: %v", err)
	}
	defer resp.Body.Close()

	// Read and print the response body
	respBody, err := io.ReadAll(resp.Body)
	if err != nil {
		return successResp, fmt.Errorf("failed to read response body: %v", err)
	}

	if err := json.Unmarshal(respBody, &successResp); err != nil { // Parse []byte to the go struct pointer
		return successResp, fmt.Errorf("Can not unmarshal JSON: " + err.Error())
	}

	// Check the response
	if resp.StatusCode != http.StatusOK {
		// fmt.Println("Upload failed! Response: ", successResp.Message)
		return successResp, fmt.Errorf("upload failed with status: %s, %s", resp.Status, successResp.Message)
	}

	// fmt.Printf("Upload successful! Response: %s\n", respBody)
	return successResp, nil
}

func UploadFileMix(appName string, filePath string) (ResponseServiceUploadMix, error) {

	var successResp ResponseServiceUploadMix

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

	var contentType []string

	switch g.FileExt {
	case ".docx", ".doc":
		contentType = []string{"application/vnd.openxmlformats-officedocument.wordprocessingml.document"}
	case ".zip":
		contentType = []string{"application/zip"}
	case ".rar":
		contentType = []string{"application/vnd.rar"}
	case ".pptx":
		contentType = []string{"application/vnd.openxmlformats-officedocument.presentationml.presentation"}
	case ".ppt":
		contentType = []string{"application/vnd.ms-powerpoint"}
	case ".rtf":
		contentType = []string{"application/rtf"}
	}

	part, err := writer.CreatePart(textproto.MIMEHeader{
		"Content-Disposition": []string{fmt.Sprintf(`form-data; name="%s"; filename="%s"`, "file", filepath.Base(filePath))},
		"Content-Type":        contentType, // Explicitly set MIME type
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
	urlServiceUpload := os.Getenv("URL_SERVICE_UPLOAD") + "/" + "pdf-mix"
	fmt.Println("urlServiceUpload: ", urlServiceUpload)

	req, err := http.NewRequest("POST", urlServiceUpload, body)
	if err != nil {
		return successResp, fmt.Errorf("failed to create request: %v", err)
	}

	// fmt.Println(req)

	// Set the content type header with the boundary
	req.Header.Set("Content-Type", writer.FormDataContentType())

	// Create a custom transport that skips TLS verification
	tr := &http.Transport{
		TLSClientConfig: &tls.Config{InsecureSkipVerify: true},
	}

	// Send the request
	client := &http.Client{Transport: tr}
	resp, err := client.Do(req)
	if err != nil {
		return successResp, fmt.Errorf("failed to send request: %v", err)
	}
	defer resp.Body.Close()

	// Read and print the response body
	respBody, err := io.ReadAll(resp.Body)
	if err != nil {
		return successResp, fmt.Errorf("failed to read response body: %v", err)
	}

	if err := json.Unmarshal(respBody, &successResp); err != nil { // Parse []byte to the go struct pointer
		return successResp, fmt.Errorf("Can not unmarshal JSON: " + err.Error())
	}

	// Check the response
	if resp.StatusCode != http.StatusOK {
		// fmt.Println("Upload failed! Response: ", successResp.Message)
		return successResp, fmt.Errorf("upload failed with status: %s, %s", resp.Status, successResp.Message)
	}

	// fmt.Printf("Upload successful! Response: %s\n", respBody)
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
