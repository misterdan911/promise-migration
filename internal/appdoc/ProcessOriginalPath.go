package appdoc

import (
	"fmt"
	"log"
	"net/url"
	"path"
	"path/filepath"
	"promise-migration/internal/g"
	"promise-migration/internal/model/dbsidapet/helperdokumenmodel"
	"strings"

	"github.com/jackc/pgx/v5/pgtype"
)

func ProcessOriginalPath(originalPath pgtype.Text) error {

	if g.LogDoc.PkId < 331 {
		return nil
	}

	// reset FilePath	
	g.FilePath = "D:/Danu/repo/golang/promise-migration/files/tmp"

  // Cek apakah dokumen sudah pernah berhasil di proses
  helperDokumen := helperdokumenmodel.GetByOriginalPath(originalPath)

  // Kalau dokumen belum pernah berhasil
  if (helperDokumen == helperdokumenmodel.HelperDokumen{}) {

    // dapatkan url yg akan di download
    // urlPath := g.BasePath + "/" + originalPath.String
    urlPath := g.UrlBasePathExisting + "/" + originalPath.String
    g.LogDoc.OriPath = urlPath

    // download dokumen start
    // --------------------------------------------------------------------------------------------
		
		fileName := path.Base(urlPath)
		g.FileExt = strings.ToLower(filepath.Ext(fileName))
		fileNameEncoded := url.PathEscape(fileName)
		urlPath = strings.Replace(urlPath, fileName, fileNameEncoded, 1)

		g.FilePath = g.FilePath + "/" + fileNameEncoded
	
		if g.FileExt == ".rar" || g.FileExt == ".zip" {
			// skip aja proses downloadnya untuk sementara
			fmt.Println("Skipping... " + urlPath)
			return nil
		} else {
			fmt.Println("Extension: " + g.FileExt)
		}

		fmt.Println("Downloading File: " + urlPath)
    errDl := DownloadFile(urlPath)
    if errDl != nil {

      // kalau file yg mau didownload tidak ditemukan
      if errDl.Error() == "bad status: 404 Not Found" {
        g.LogDoc.DownStat = "Failed - 404 Not Found"
        // print log ke konsol
        PrintLog()
        return nil // Supaya func ProcessOriginalPath berhenti sampai disini
      }

      // kalau connection was forcibly closed by the remote host
			if strings.Contains(errDl.Error(), "closed by the remote host") {
        g.LogDoc.DownStat = "Failed - Connection was forcibly closed by the remote host"
        PrintLog()
        return nil
      }
			
      // untuk error2 download yg lain dibuat fatal error aja supaya programnya stop sampai disini
      g.LogDoc.DownStat = "Failed"
      PrintLog()
      log.Fatal(errDl.Error())
    } else {
      g.LogDoc.DownStat = "Success"
    }
    // download dokumen end
    // --------------------------------------------------------------------------------------------


    // upload dokumen start
    // --------------------------------------------------------------------------------------------
		fmt.Println("Uploading File...")
		var SuccessResponse ResponseServiceUpload
		var errUp error

		if g.FileExt == ".pdf" {
			SuccessResponse, errUp = UploadFilePdf(g.AppName, g.FilePath)
			if errUp != nil {

				// kalau gagal upload karena error 'invalid pdf header'
				if strings.Contains(errUp.Error(), "invalid pdf header") {
					g.LogDoc.UpStat = "Failed - invalid pdf header"
					// print log ke konsol
					PrintLog()
					return nil // Supaya func ProcessOriginalPath berhenti sampai disini
				} else if strings.Contains(errUp.Error(), "EOF marker not found") {
					g.LogDoc.UpStat = "Failed - EOF marker not found"
					PrintLog()
					return nil
				} else if strings.Contains(errUp.Error(), "EmptyFileError") {
					g.LogDoc.UpStat = "Failed - pypdf.errors.EmptyFileError: Cannot read an empty file"
					PrintLog()
					return nil
				} else if strings.Contains(errUp.Error(), "NullObject") {
					g.LogDoc.UpStat = "Failed - TypeError: argument of type 'NullObject' is not iterable"
					PrintLog()
					return nil
				}
				
				g.LogDoc.UpStat = "Failed"
				PrintLog()
				log.Fatal(errUp.Error())
			} else {
				g.LogDoc.UpStat = "Success"
        DeleteFile(g.FilePath)
			}
		}

		if g.FileExt == ".xlsx" || g.FileExt == ".xls" {
			SuccessResponse, errUp = UploadFileExcel(g.AppName, g.FilePath)
			if errUp != nil {
				g.LogDoc.UpStat = "Failed"
				PrintLog()
				log.Fatal(errUp.Error())
			} else {
				g.LogDoc.UpStat = "Success"
        DeleteFile(g.FilePath)
			}
		}
    // upload dokumen end
    // --------------------------------------------------------------------------------------------

    // defer DeleteFile(g.FilePath)


    // Insert ke table db_sidapet.helper_dokumen
		if g.LogDoc.UpStat == "Success" {
			helperDokumen.AppName = pgtype.Text{Valid:true, String:g.AppName}
			helperDokumen.OriginalPath = originalPath
			helperDokumen.Newfilename = pgtype.Text{Valid: true, String: SuccessResponse.Data[0].FileName}
			helperDokumen.EncryptKey = pgtype.Text{Valid: true, String: SuccessResponse.Data[0].Keypass}
			helperdokumenmodel.InsertNew(helperDokumen)
		}

  }

  /*
  if g.LogDoc.DownStat == "Success" {
    PrintLog()
    log.Fatal("Stop Dulu")
  }
  */

  PrintLog()

  return nil
}

