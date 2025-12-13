package tblsptbplmodel

import (
	"context"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"

	"promise-migration/internal/sibela/structs"
)

func GetByIdTerminPl(idTerminPl pgtype.Int4) structs.TblSuratBap {
	var tblSuratBap structs.TblSuratBap
	ctx := context.Background()

	qSptbPl := `
	SELECT
		id_sptb_pl,
		id_termin_pl,
		nomor_sptb,
		jenis_objek_pajak,
		jenis_pengadaan,
		nilai_perhitungan,
		dpp_ppn,
		dpp_pph,
		ppn_sptb,
		pph_sptb,
		jenis_pph,
		id_objek_pajak,
		additional,
		dok_non_pkp,
		dok_ketentuan_khusus,
		dok_ketentuan_khusus_jenis,
		ketentuan_khusus,
		ketentuan_khusus_keterangan,
		ketentuan_khusus_dpp,
		ketentuan_khusus_jenis,
		sptb_file,
		hash_dokumen_sptb,
		file_scan_sptb,
		ringkasankontrak_file,
		hash_dokumen_ringkasankontrak,
		file_scan_rk,
		nomor_faktur_pajak,
		tanggal_faktur_pajak,
		faktur_pajak_file,
		hash_dokumen_faktur_pajak,
		ssp_file,
		hash_dokumen_ssp,
		ppn_persen,
		pph_persen,
		transaksi,
		tertanggal_sptb
	FROM tbl_sptb_pl
	WHERE id_termin_pl = $1`

	rwSptbPl, err := db.PromiseSibela.Query(ctx, qSptbPl, idTerminPl)
	if err != nil {
		log.Fatal("qSptbPl Failed, " + err.Error() + " " + qSptbPl)
	}

	allSptbPl, err := pgx.CollectRows(rwSptbPl, pgx.RowToStructByName[structs.TblSuratBap])
	if err != nil {
		log.Fatal("failed collecting rwSptbPl (tblsptbplmodel.go:GetByIdTerminPl), " + err.Error())
	}
	defer rwSptbPl.Close()

	if len(allSptbPl) > 0 {
		tblSuratBap = allSptbPl[0]
	}

	return tblSuratBap
}
