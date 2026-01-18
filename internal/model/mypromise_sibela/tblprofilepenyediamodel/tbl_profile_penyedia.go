package tblprofilepenyediamodel

import (
		"log"
    "database/sql"
    "promise-migration/db"
)

type TblProfilePenyediaDocument struct {
    IdProfilPenyedia   sql.NullInt32
    PathKtp            sql.NullString
    PathDomisili       sql.NullString
    PathRek            sql.NullString
    PathNpwp           sql.NullString
    PathLapPerus       sql.NullString
    PathIkutSerta      sql.NullString
    PathKuasa          sql.NullString
}

// Helper method to convert NullString to regular string
func (d *TblProfilePenyediaDocument) GetPathKtp() string {
    if d.PathKtp.Valid {
        return d.PathKtp.String
    }
    return ""
}

// Add similar helper methods for other fields if needed...

func GetAllDocument() ([]TblProfilePenyediaDocument, error) {
    qData := `
    SELECT
        id_profil_penyedia,
        path_ktp,
        path_domisili,
        path_rek,
        path_npwp,
        path_lap_perus,
        path_ikut_serta,
        path_kuasa
    FROM tbl_profile_penyedia
    WHERE id_profil_penyedia >= 0
    ORDER BY id_profil_penyedia`

  results, err := db.MyPromiseSibela.Query(qData)
  if err != nil {
		log.Fatal(err)
	}
    defer results.Close()

    var documents []TblProfilePenyediaDocument

    for results.Next() {
        var doc TblProfilePenyediaDocument
        err := results.Scan(
            &doc.IdProfilPenyedia,
            &doc.PathKtp,
            &doc.PathDomisili,
            &doc.PathRek,
            &doc.PathNpwp,
            &doc.PathLapPerus,
            &doc.PathIkutSerta,
            &doc.PathKuasa,
        )
        if err != nil {
            return nil, err
        }
        documents = append(documents, doc)
    }

    if err = results.Err(); err != nil {
        return nil, err
    }

    return documents, nil
}
