package tbltermindptplmodel

import (
	"context"
	"log"
	"promise-migration/db"
	"promise-migration/internal/sibela/structs"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

func GetLastStatusTerminBast(idPaket pgtype.Int4) pgtype.Int8 {
	ctx := context.Background()

	qSelect := `
	SELECT
		nama_termin,
		status_termin_dptbast AS status_termin_bast
	FROM tbl_termindpt_pl
	where id_paket_dptpl = $1
	ORDER BY id_termin_dptpl DESC
	LIMIT 1`

	rwData, err := db.PromiseSibela.Query(ctx, qSelect, idPaket)
	if err != nil {
		log.Fatal("qSelect Failed (tbl_termindpt_pl.go::GetLastStatusTerminBast), " + err.Error() + " " + qSelect)
	}

	allData, err2 := pgx.CollectRows(rwData, pgx.RowToStructByName[structs.StatusTerminBast])
	if err2 != nil {
		log.Fatal("failed collecting rwData (tbl_termindpt_pl.go::GetLastStatusTerminBast), " + err2.Error())
	}
	defer rwData.Close()

	var statusTerminBast pgtype.Int8

	if len(allData) > 0 {
		statusTerminBast = allData[0].StatusTerminBast
	}

	return statusTerminBast
}

// persen_termin::DECIMAL AS persen_termin,

func GetByIdPaketPl(idPaketPl pgtype.Int4) []structs.TblTerminPl {
	ctx := context.Background()

	qTblTerminPl := `
        SELECT
					id_termin_dptpl AS id_termin_pl,
					id_paket_dptpl AS id_paket_pl,
					nama_termin,
					persen_termin,
					status_termin_dptbast AS status_termin_bast,
					status_pajak,
					spp_sebelumnya,
					spp_ini,
					spp_ini_sd,
					sisa_pagu,
					path_kwitansidpt AS path_kwitansi,
					path_bast_penyediadpt AS path_bast_penyedia,
					path_bast_ppdpt AS path_bast_pp,
					hash_dokumen_bast,
					termin_file,
					file_scan_bast,
					tanggal_kwitansi,
					nomor_kwitansi,
					path_kwitansi_ppk,
					path_kwitansi_penyedia,
					kwitansi_file,
					hash_dokumen_kwitansi,
					spp_file,
					hash_dokumen_spp,
					file_scan_spp,
					tanggal_spp,
					nomor_spp,
					jenis_pembayaran,
					sumber_dana,
					id_unit_layanan,
					unit_layanan,
					tanggal_bast_terealisasi,
					create_at,
					status_aset
        FROM tbl_termindpt_pl
        WHERE id_paket_dptpl = $1`

	rwTblTerminPl, err := db.PromiseSibela.Query(ctx, qTblTerminPl, idPaketPl)
	if err != nil {
		log.Fatal("qTblTerminPl Failed, " + err.Error() + " " + qTblTerminPl)
	}

	allTblTerminPl, err2 := pgx.CollectRows(rwTblTerminPl, pgx.RowToStructByName[structs.TblTerminPl])
	if err2 != nil {
		log.Fatal("failed collecting rwTblTerminPl (tbl_termindpt_pl.go:GetByIdPaketPl), " + err2.Error())
	}
	defer rwTblTerminPl.Close()

	return allTblTerminPl
}
