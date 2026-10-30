package appdoc

import (
	"promise-migration/internal/g"
	"promise-migration/internal/model/mypromise_siqut/tblsiqutdppmodel"

	"github.com/jackc/pgx/v5/pgtype"
)

func MigrateFileFromPromiseSiqutTblSiqutDpp() {
	allRows, _ := tblsiqutdppmodel.GetAllDocument()
	originalPath := pgtype.Text{Valid: true, String: ""}

	for _, row := range allRows {

		// Process path_rancangan_kontrak
		if row.PathRancanganKontrak.String != "" {
			g.LogDoc.FieldName = "promise_siqut.tbl_siqut_dpp.path_rancangan_kontrak"
			g.LogDoc.PkId = row.IdSiqutDpp.Int32

			originalPath.String = row.PathRancanganKontrak.String
			ProcessOriginalPath(originalPath)
		}

		// Process path_kak
		if row.PathKak.String != "" {
			g.LogDoc.FieldName = "promise_siqut.tbl_siqut_dpp.path_kak"
			g.LogDoc.PkId = row.IdSiqutDpp.Int32

			originalPath.String = row.PathKak.String
			ProcessOriginalPath(originalPath)
		}

		// Process path_spek
		if row.PathSpek.String != "" {
			g.LogDoc.FieldName = "promise_siqut.tbl_siqut_dpp.path_spek"
			g.LogDoc.PkId = row.IdSiqutDpp.Int32

			originalPath.String = row.PathSpek.String
			ProcessOriginalPath(originalPath)
		}

		// Process path_quotation
		if row.PathQuotation.String != "" {
			g.LogDoc.FieldName = "promise_siqut.tbl_siqut_dpp.path_quotation"
			g.LogDoc.PkId = row.IdSiqutDpp.Int32

			originalPath.String = row.PathQuotation.String
			ProcessOriginalPath(originalPath)
		}

		// Process path_dok_ba
		if row.PathDokBa.String != "" {
			g.LogDoc.FieldName = "promise_siqut.tbl_siqut_dpp.path_dok_ba"
			g.LogDoc.PkId = row.IdSiqutDpp.Int32

			originalPath.String = row.PathDokBa.String
			ProcessOriginalPath(originalPath)
		}

		// Process path_dok_addendum
		if row.PathDokAddendum.String != "" {
			g.LogDoc.FieldName = "promise_siqut.tbl_siqut_dpp.path_dok_addendum"
			g.LogDoc.PkId = row.IdSiqutDpp.Int32

			originalPath.String = row.PathDokAddendum.String
			ProcessOriginalPath(originalPath)
		}
	}
}

