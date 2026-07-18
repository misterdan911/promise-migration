package tblsuratbapmodel

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
		id_surat_bap,
		id_termin_pl,
		id_pkualitas,
		nomor_bap,
		tanggal_bap,
		path_bap,
		CAST(NULLIF(TRIM(nominal_denda), '') AS numeric) as nominal_denda,
		bap_status,
		bap_barcode,
		bap_file,
		hash_dokumen,
		file_scan_bap,
		tertanggal_bap
	FROM tbl_surat_bap
	WHERE id_termin_pl = $1`

	rwSuratBap, err := db.PromiseSibela.Query(ctx, qSuratBap, idTerminPl)
	if err != nil {
		log.Fatal("qSuratBap Failed, " + err.Error() + " " + qSuratBap)
	}

	allSuratBap, err := pgx.CollectRows(rwSuratBap, pgx.RowToStructByName[structs.TblSuratBap])
	if err != nil {
		log.Fatal("failed collecting rwSuratBap (tblsuratbapmodel.go:GetByIdTerminPl), " + err.Error())
	}
	defer rwSuratBap.Close()

	if len(allSuratBap) > 0 {
		tblSuratBap = allSuratBap[0]
	}

	return tblSuratBap
}
