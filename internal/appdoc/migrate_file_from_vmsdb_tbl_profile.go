package appdoc

import (
	"log"
	"promise-migration/internal/model/vmsdb/tblprofilepenyediamodel"
)

func MigrateFileFromVmsDbTblProfile() {

  urlPath := "https://sidapet-promiseterbuka.ut.ac.id"


  allTblProfilePenyedia := tblprofilepenyediamodel.GetAllData()

  for _, tblProfilePenyedia := range allTblProfilePenyedia {

    // kalau field di kolomnya kosong, skip
    if tblProfilePenyedia.PathKtp.String == "" {
      continue
    }

    urlPath = urlPath + "/" + tblProfilePenyedia.PathKtp.String
    filePath, _ := DownloadFile(urlPath)

    errUpload := UploadFile("SI-DaPeT", filePath)
    if errUpload != nil {
      log.Fatal("Error processing file: " + errUpload.Error())
    }

    break
  }
}

