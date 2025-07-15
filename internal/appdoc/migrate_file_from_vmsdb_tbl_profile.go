package appdoc

import (
	"fmt"
	"log"
	"promise-migration/internal/model/dbsidapet/helperdokumenmodel"
	"promise-migration/internal/model/myvmsdb/tblprofilepenyediamodel"

	"github.com/jackc/pgx/v5/pgtype"
)

func MigrateFileFromVmsDbTblProfile() {

  basePath := "https://sidapet-promiseterbuka.ut.ac.id"


  allTblProfilePenyedia, _ := tblprofilepenyediamodel.GetAllDocument()

  for _, tblProfilePenyedia := range allTblProfilePenyedia {

    // kalau field di kolomnya kosong, skip
    if tblProfilePenyedia.PathKtp.String == "" {
      continue
    }

    fmt.Println(tblProfilePenyedia.PathKtp.String)

    originalPath := pgtype.Text{Valid: true, String: tblProfilePenyedia.PathKtp.String}

    helperDokumen := helperdokumenmodel.GetByOriginalPath(originalPath)
    if (helperDokumen == helperdokumenmodel.HelperDokumen{}) {

      urlPath := basePath + "/" + tblProfilePenyedia.PathKtp.String
      filePath, _ := DownloadFile(urlPath)

      SuccessResponse, errUpload := UploadFile("SI-DaPeT", filePath)
      if errUpload != nil {
        log.Fatal("Error processing file: " + errUpload.Error())
      }

      fmt.Println("FileName: " + SuccessResponse.Data[0].FileName)

      helperDokumen.OriginalPath = originalPath
      helperDokumen.Newfilename = pgtype.Text{Valid: true, String: SuccessResponse.Data[0].FileName}
      helperDokumen.EncryptKey = pgtype.Text{Valid: true, String: SuccessResponse.Data[0].Keypass}
      helperdokumenmodel.InsertNew(helperDokumen)
    } 

    // break
  }
}

