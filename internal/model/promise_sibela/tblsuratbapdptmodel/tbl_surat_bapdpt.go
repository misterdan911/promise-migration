package tblsuratbapdptmodel

import (
	"context"
	"log"
	"promise-migration/db"

	"promise-migration/internal/sibela/structs"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

func GetByIdTerminPl(idTerminPl pgtype.Int4) structs.TblSuratBap {
	var tblSuratBap structs.TblSuratBap
	ctx := context.Background()

	qSuratBap := `
	SELECT
		id_surat_bapdpt AS id_surat_bap,
		id_termin_dptpl AS id_termin_pl,
		id_pkualitas,
		nomor_bapdpt AS nomor_bap,
		tanggal_bapdpt AS tanggal_bap,
		path_bapdpt AS path_bap,
		nominal_denda,
		NULL AS bap_status,
		NULL As bap_barcode,
		bap_file,
		hash_dokumen,
		file_scan_bap,
		tertanggal_bapdpt AS tertanggal_bap
	FROM tbl_surat_bap
	WHERE id_termin_pl = $1`

	rwSuratBap, err := db.DbSidapet.Query(ctx, qSuratBap, idTerminPl)
	if err != nil {
		log.Fatal("qSuratBap Failed, " + err.Error() + " " + qSuratBap)
	}

	allSuratBap, err := pgx.CollectRows(rwSuratBap, pgx.RowToStructByName[structs.TblSuratBap])
	if err != nil {
		log.Fatal("failed collecting rwSuratBap (tblsuratbapdptmodel.go:GetByIdTerminPl), " + err.Error())
	}
	defer rwSuratBap.Close()

	if len(allSuratBap) > 0 {
		tblSuratBap = allSuratBap[0]
	}

	return tblSuratBap
}
