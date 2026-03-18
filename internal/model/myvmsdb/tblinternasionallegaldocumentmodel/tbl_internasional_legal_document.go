package tblinternasionallegaldocumentmodel

import (
  "database/sql"
  "promise-migration/db"
)

type TblInternasionalLegalDocument struct {
  IdLegalDocument          sql.NullInt32
  IdPenyediaInternasional  sql.NullInt32
  NamaDokumen              sql.NullString
  PathDokumen              sql.NullString
}

func GetAllDocument() ([]TblInternasionalLegalDocument, error) {
  qData := `
  SELECT
    id_legal_document,
    id_penyedia_internasional,
    nama_dokumen,
    path_dokumen
  FROM tbl_internasional_legal_document
  WHERE id_legal_document >= 0
  ORDER BY id_legal_document ASC`

  results, err := db.MyVmsDb.Query(qData)
  if err != nil {
    return nil, err
  }
  defer results.Close()

  var documents []TblInternasionalLegalDocument

  for results.Next() {
    var doc TblInternasionalLegalDocument
    err := results.Scan(
      &doc.IdLegalDocument,
      &doc.IdPenyediaInternasional,
      &doc.NamaDokumen,
      &doc.PathDokumen,
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

