package tblprofilepenyediamodel

import (
    "database/sql"
    "promise-migration/db"
)

type TblProfilePenyediaDocument struct {
    PathKtp           sql.NullString
    PathDomisili      sql.NullString
    PathRek           sql.NullString
    PathNpwp          sql.NullString
    PathLapPerus      sql.NullString
    PathIkutSerta     sql.NullString
    PathKuasa         sql.NullString
    PathSkb           sql.NullString
    PathSkpp23        sql.NullString
    PathPphDibebaskan sql.NullString
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
        path_ktp,
        path_domisili,
        path_rek,
        path_npwp,
        path_lap_perus,
        path_ikut_serta,
        path_kuasa,
        path_skb,
        path_skpp23,
        path_pph_dibebaskan
    FROM tbl_profile_penyedia`

    results, err := db.MyVmsDb.Query(qData)
    if err != nil {
        return nil, err
    }
    defer results.Close()

    var documents []TblProfilePenyediaDocument

    for results.Next() {
        var doc TblProfilePenyediaDocument
        err := results.Scan(
            &doc.PathKtp,
            &doc.PathDomisili,
            &doc.PathRek,
            &doc.PathNpwp,
            &doc.PathLapPerus,
            &doc.PathIkutSerta,
            &doc.PathKuasa,
            &doc.PathSkb,
            &doc.PathSkpp23,
            &doc.PathPphDibebaskan,
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