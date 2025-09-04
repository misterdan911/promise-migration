package appdoc

import (
	"log"
	"promise-migration/internal/g"
	"promise-migration/internal/model/dbsidapet/helperdokumenmodel"
	"strings"

	"github.com/jackc/pgx/v5/pgtype"
)

func ProcessOriginalPath(originalPath pgtype.Text) error {
  // Cek apakah dokumen sudah pernah berhasil di proses
  helperDokumen := helperdokumenmodel.GetByOriginalPath(originalPath)

  // Kalau dokumen belum pernah berhasil
  if (helperDokumen == helperdokumenmodel.HelperDokumen{}) {

    // dapatkan url yg akan di download
    urlPath := g.BasePath + "/" + originalPath.String
    g.LogDoc.OriPath = urlPath

    // download dokumen start
    // --------------------------------------------------------------------------------------------
    errDl := DownloadFile(urlPath)
    if errDl != nil {

      // kalau file yg mau didownload tidak ditemukan
      if errDl.Error() == "bad status: 404 Not Found" {
        g.LogDoc.DownStat = "Failed - 404 Not Found"
        // print log ke konsol
        PrintLog()
        return nil // Supaya func ProcessOriginalPath berhenti sampai disini
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
    SuccessResponse, errUp := UploadFile("SI-DaPeT", FilePath)
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
      }
			
      g.LogDoc.UpStat = "Failed"
      PrintLog()
      log.Fatal(errUp.Error())
    } else {
      g.LogDoc.UpStat = "Success"
    }
    // upload dokumen end
    // --------------------------------------------------------------------------------------------

    defer DeleteFile(FilePath)

    // Insert ke table db_sidapet.helper_dokumen
    helperDokumen.OriginalPath = originalPath
    helperDokumen.Newfilename = pgtype.Text{Valid: true, String: SuccessResponse.Data[0].FileName}
    helperDokumen.EncryptKey = pgtype.Text{Valid: true, String: SuccessResponse.Data[0].Keypass}
    helperdokumenmodel.InsertNew(helperDokumen)
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

/*
func ProcessOriginalPath(originalPath pgtype.Text) error {

  // Cek apakah dokumen sudah pernah berhasil di proses
	helperDokumen := helperdokumenmodel.GetByOriginalPath(originalPath)

  // Kalau dokumen belum pernah berhasil
	if (helperDokumen == helperdokumenmodel.HelperDokumen{}) {

		urlPath := g.BasePath + "/" + originalPath.String
    g.LogDoc.OriPath = urlPath

    // download dokumen dari url ori
		filePath, errDownload := DownloadFile(urlPath)
		if errDownload != nil {
			if errDownload.Error() == "bad status: 404 Not Found" {
        g.LogDoc.DownStat = "Failed - 404 Not Found"
				return nil // Supaya func ProcessOriginalPath berhenti sampai disini
			}
			log.Fatal("Error downloading file: " + errDownload.Error())
		} else {
        g.LogDoc.DownStat = "Success"
    }

    // upload dokumen ke Service Upload
		SuccessResponse, errUpload := UploadFile("SI-DaPeT", filePath)
  
    // fmt.Printf("Response: %s\n", SuccessResponse)

		if errUpload != nil {
      g.LogDoc.UpStat = "Failed"
      PrintLog()
			log.Fatal("Error processing file: " + errUpload.Error())
		} else {

      g.LogDoc.UpStat = "Success"

      defer DeleteFile(FilePath)

      // Insert ke table db_siapet.helper_dokumen
      helperDokumen.OriginalPath = originalPath
      helperDokumen.Newfilename = pgtype.Text{Valid: true, String: SuccessResponse.Data[0].FileName}
      helperDokumen.EncryptKey = pgtype.Text{Valid: true, String: SuccessResponse.Data[0].Keypass}
      helperdokumenmodel.InsertNew(helperDokumen)
    }
	}

	return nil
}
*/
