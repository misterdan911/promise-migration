package appdoc

import (
	// "fmt"
	"fmt"
	"path/filepath"
	"promise-migration/internal/g"
	"promise-migration/internal/ghelper"
	"promise-migration/internal/model/myvmsdb/tblprofilepenyediamodel"
	"strconv"

	"github.com/jackc/pgx/v5/pgtype"
)

// var BasePath string = "https://sidapet-promiseterbuka.ut.ac.id"

func MigrateFileFromVmsDbTblProfilePenyedia() {
  allTblProfilePenyedia, _ := tblprofilepenyediamodel.GetAllDocument()
  originalPath := pgtype.Text{Valid: true, String: ""}

  for _, tblProfilePenyedia := range allTblProfilePenyedia {

    // if tblProfilePenyedia.IdProfilPenyedia.Int32 != 437 {
    //   continue
    // }

    // vms_db.tbl_profile_penyedia.path_ktp
    if tblProfilePenyedia.PathKtp.String != "" {
      g.LogDoc.FieldName = "vms_db.tbl_profile_penyedia.path_ktp"
      g.LogDoc.PkId = tblProfilePenyedia.IdProfilPenyedia.Int32

      originalPath.String = tblProfilePenyedia.PathKtp.String
      ProcessOriginalPathNew(originalPath)
    }

    // vms_db.path_domisili
    if tblProfilePenyedia.PathDomisili.String != "" {
      g.LogDoc.FieldName = "vms_db.tbl_profile_penyedia.path_domisili"
      g.LogDoc.PkId = tblProfilePenyedia.IdProfilPenyedia.Int32

      originalPath.String = tblProfilePenyedia.PathDomisili.String
      ProcessOriginalPathNew(originalPath)
    }

    // path_rek,
    if tblProfilePenyedia.PathRek.String != "" {
      g.LogDoc.FieldName = "vms_db.tbl_profile_penyedia.path_rek"
      g.LogDoc.PkId = tblProfilePenyedia.IdProfilPenyedia.Int32

      originalPath.String = tblProfilePenyedia.PathRek.String
      ProcessOriginalPathNew(originalPath)
    }

  }
}

/*
func MigrateFileFromVmsDbTblProfilePenyediaOld() {

	// g.BasePath = "https://sidapet-promiseterbuka.ut.ac.id"

	allTblProfilePenyedia, _ := tblprofilepenyediamodel.GetAllDocument()
	originalPath := pgtype.Text{Valid: true, String: ""}

	for _, tblProfilePenyedia := range allTblProfilePenyedia {

		// vms_db.tbl_profile_penyedia.path_ktp
		if tblProfilePenyedia.PathKtp.String != "" {
			g.LogDoc.FieldName = "vms_db.tbl_profile_penyedia.path_ktp"
			g.LogDoc.PkId = tblProfilePenyedia.IdProfilPenyedia.Int32

			originalPath.String = tblProfilePenyedia.PathKtp.String
			ProcessOriginalPath(originalPath)
      PrintLog()
		}

		// vms_db.path_domisili
		if tblProfilePenyedia.PathDomisili.String != "" {
			g.LogDoc.FieldName = "vms_db.tbl_profile_penyedia.path_domisili"
			g.LogDoc.PkId = tblProfilePenyedia.IdProfilPenyedia.Int32

			originalPath.String = tblProfilePenyedia.PathDomisili.String
			ProcessOriginalPath(originalPath)
      PrintLog()
		}

		// path_rek,
		if tblProfilePenyedia.PathRek.String != "" {
			g.LogDoc.FieldName = "vms_db.tbl_profile_penyedia.path_rek"
			g.LogDoc.PkId = tblProfilePenyedia.IdProfilPenyedia.Int32

			originalPath.String = tblProfilePenyedia.PathRek.String
			ProcessOriginalPath(originalPath)
      PrintLog()
		}

		// path_npwp,
		if tblProfilePenyedia.PathNpwp.String != "" {
			g.LogDoc.FieldName = "vms_db.tbl_profile_penyedia.path_npwp"
			g.LogDoc.PkId = tblProfilePenyedia.IdProfilPenyedia.Int32

			originalPath.String = tblProfilePenyedia.PathNpwp.String
			ProcessOriginalPath(originalPath)
      PrintLog()
		}

		// path_lap_perus,
		if tblProfilePenyedia.PathLapPerus.String != "" {
			g.LogDoc.FieldName = "vms_db.tbl_profile_penyedia.path_lap_perus"
			g.LogDoc.PkId = tblProfilePenyedia.IdProfilPenyedia.Int32

			originalPath.String = tblProfilePenyedia.PathLapPerus.String
			ProcessOriginalPath(originalPath)
      PrintLog()
		}

		// path_ikut_serta,
		if tblProfilePenyedia.PathIkutSerta.String != "" {
			g.LogDoc.FieldName = "vms_db.tbl_profile_penyedia.path_ikut_serta"
			g.LogDoc.PkId = tblProfilePenyedia.IdProfilPenyedia.Int32

			originalPath.String = tblProfilePenyedia.PathIkutSerta.String
			ProcessOriginalPath(originalPath)
      PrintLog()
		}

		// path_kuasa,
		if tblProfilePenyedia.PathKuasa.String != "" {
			g.LogDoc.FieldName = "vms_db.tbl_profile_penyedia.path_kuasa"
			g.LogDoc.PkId = tblProfilePenyedia.IdProfilPenyedia.Int32

			originalPath.String = tblProfilePenyedia.PathKuasa.String
			ProcessOriginalPath(originalPath)
      PrintLog()
		}

		// path_skb,
		if tblProfilePenyedia.PathSkb.String != "" {
			g.LogDoc.FieldName = "vms_db.tbl_profile_penyedia.path_skb"
			g.LogDoc.PkId = tblProfilePenyedia.IdProfilPenyedia.Int32

			originalPath.String = tblProfilePenyedia.PathSkb.String
			ProcessOriginalPath(originalPath)
      PrintLog()
		}

		// path_skpp23,
		if tblProfilePenyedia.PathSkpp23.String != "" {
			g.LogDoc.FieldName = "vms_db.tbl_profile_penyedia.path_skpp23"
			g.LogDoc.PkId = tblProfilePenyedia.IdProfilPenyedia.Int32

			originalPath.String = tblProfilePenyedia.PathSkpp23.String
			ProcessOriginalPath(originalPath)
      PrintLog()
		}

		// path_pph_dibebaskan
		if tblProfilePenyedia.PathPphDibebaskan.String != "" {
			g.LogDoc.FieldName = "vms_db.tbl_profile_penyedia.path_pph_dibebaskan"
			g.LogDoc.PkId = tblProfilePenyedia.IdProfilPenyedia.Int32

			originalPath.String = tblProfilePenyedia.PathPphDibebaskan.String
			ProcessOriginalPath(originalPath)
      PrintLog()
		}

	}
}
*/



func PrintLog() {
  if g.LogDoc.OriPath != "" {
    fmt.Println("FieldName: " + g.LogDoc.FieldName)
    fmt.Println("PK ID: " + strconv.Itoa(int(g.LogDoc.PkId)))
    fmt.Println("Url: " + g.LogDoc.OriPath)
    fmt.Println("Download: " + g.LogDoc.DownStat)
    fmt.Println("Upload: " + g.LogDoc.UpStat)
    fmt.Println("")

    logPath := filepath.Join("dokumen.log")
    ghelper.Log(logPath, "FieldName: " + g.LogDoc.FieldName)
    ghelper.Log(logPath, "PK ID: " + strconv.Itoa(int(g.LogDoc.PkId)))
    ghelper.Log(logPath, "Url: " + g.LogDoc.OriPath)
    ghelper.Log(logPath, "Download: " + g.LogDoc.DownStat)
    ghelper.Log(logPath, "Upload: " + g.LogDoc.UpStat)
    ghelper.Log(logPath, "")
  }

  defer ClearGLogDoc()
}

func ClearGLogDoc() {
  g.LogDoc.FieldName = ""
  g.LogDoc.PkId = 0
  g.LogDoc.OriPath = ""
  g.LogDoc.DownStat = ""
  g.LogDoc.UpStat = ""
}