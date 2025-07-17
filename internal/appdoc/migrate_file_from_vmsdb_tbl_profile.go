package appdoc

import (
	"log"
	"promise-migration/internal/g"
	"promise-migration/internal/model/dbsidapet/helperdokumenmodel"
	"promise-migration/internal/model/myvmsdb/tblprofilepenyediamodel"

	"github.com/jackc/pgx/v5/pgtype"
)

// var BasePath string = "https://sidapet-promiseterbuka.ut.ac.id"

func MigrateFileFromVmsDbTblProfilePenyedia() {

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
		}

		// vms_db.path_domisili
		if tblProfilePenyedia.PathDomisili.String != "" {
			g.LogDoc.FieldName = "vms_db.tbl_profile_penyedia.path_domisili"
			g.LogDoc.PkId = tblProfilePenyedia.IdProfilPenyedia.Int32

			originalPath.String = tblProfilePenyedia.PathDomisili.String
			ProcessOriginalPath(originalPath)
		}

		// path_rek,
		if tblProfilePenyedia.PathRek.String != "" {
			g.LogDoc.FieldName = "vms_db.tbl_profile_penyedia.path_rek"
			g.LogDoc.PkId = tblProfilePenyedia.IdProfilPenyedia.Int32

			originalPath.String = tblProfilePenyedia.PathRek.String
			ProcessOriginalPath(originalPath)
		}

		// path_npwp,
		if tblProfilePenyedia.PathNpwp.String != "" {
			g.LogDoc.FieldName = "vms_db.tbl_profile_penyedia.path_npwp"
			g.LogDoc.PkId = tblProfilePenyedia.IdProfilPenyedia.Int32

			originalPath.String = tblProfilePenyedia.PathNpwp.String
			ProcessOriginalPath(originalPath)
		}

		// path_lap_perus,
		if tblProfilePenyedia.PathLapPerus.String != "" {
			g.LogDoc.FieldName = "vms_db.tbl_profile_penyedia.path_lap_perus"
			g.LogDoc.PkId = tblProfilePenyedia.IdProfilPenyedia.Int32

			originalPath.String = tblProfilePenyedia.PathLapPerus.String
			ProcessOriginalPath(originalPath)
		}

		// path_ikut_serta,
		if tblProfilePenyedia.PathIkutSerta.String != "" {
			g.LogDoc.FieldName = "vms_db.tbl_profile_penyedia.path_ikut_serta"
			g.LogDoc.PkId = tblProfilePenyedia.IdProfilPenyedia.Int32

			originalPath.String = tblProfilePenyedia.PathIkutSerta.String
			ProcessOriginalPath(originalPath)
		}

		// path_kuasa,
		if tblProfilePenyedia.PathKuasa.String != "" {
			g.LogDoc.FieldName = "vms_db.tbl_profile_penyedia.path_kuasa"
			g.LogDoc.PkId = tblProfilePenyedia.IdProfilPenyedia.Int32

			originalPath.String = tblProfilePenyedia.PathKuasa.String
			ProcessOriginalPath(originalPath)
		}

		// path_skb,
		if tblProfilePenyedia.PathSkb.String != "" {
			g.LogDoc.FieldName = "vms_db.tbl_profile_penyedia.path_skb"
			g.LogDoc.PkId = tblProfilePenyedia.IdProfilPenyedia.Int32

			originalPath.String = tblProfilePenyedia.PathSkb.String
			ProcessOriginalPath(originalPath)
		}

		// path_skpp23,
		if tblProfilePenyedia.PathSkpp23.String != "" {
			g.LogDoc.FieldName = "vms_db.tbl_profile_penyedia.path_skpp23"
			g.LogDoc.PkId = tblProfilePenyedia.IdProfilPenyedia.Int32

			originalPath.String = tblProfilePenyedia.PathSkpp23.String
			ProcessOriginalPath(originalPath)
		}

		// path_pph_dibebaskan
		if tblProfilePenyedia.PathPphDibebaskan.String != "" {
			g.LogDoc.FieldName = "vms_db.tbl_profile_penyedia.path_pph_dibebaskan"
			g.LogDoc.PkId = tblProfilePenyedia.IdProfilPenyedia.Int32

			originalPath.String = tblProfilePenyedia.PathPphDibebaskan.String
			ProcessOriginalPath(originalPath)
		}

	}
}

func ProcessOriginalPath(originalPath pgtype.Text) error {
	helperDokumen := helperdokumenmodel.GetByOriginalPath(originalPath)

	if (helperDokumen == helperdokumenmodel.HelperDokumen{}) {

		urlPath := g.BasePath + "/" + originalPath.String
		filePath, errDownload := DownloadFile(urlPath)
		if errDownload != nil {
			if errDownload.Error() == "bad status: 404 Not Found" {
				return nil
			}
			log.Fatal("Error downloading file: " + errDownload.Error())
		}

		SuccessResponse, errUpload := UploadFile("SI-DaPeT", filePath)
		if errUpload != nil {
			log.Fatal("Error processing file: " + errUpload.Error())
		}

		// fmt.Println("FileName: " + SuccessResponse.Data[0].FileName)

		helperDokumen.OriginalPath = originalPath
		helperDokumen.Newfilename = pgtype.Text{Valid: true, String: SuccessResponse.Data[0].FileName}
		helperDokumen.EncryptKey = pgtype.Text{Valid: true, String: SuccessResponse.Data[0].Keypass}
		helperdokumenmodel.InsertNew(helperDokumen)

	}

	return nil
}
