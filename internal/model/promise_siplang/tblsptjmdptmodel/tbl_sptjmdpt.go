package tblsptjmdptmodel

import (
	"context"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"

	"promise-migration/internal/siplang/structs"
)

func GetByIdPaket(idPaket pgtype.Int4) structs.TblSptjm {
	ctx := context.Background()
	var tblSptjm structs.TblSptjm

	qTblSptjm := `
        SELECT
					id_sptjmdpt AS id_sptjm,
					id_paket_dptpl AS id_paket_pl,
					tanggal_sptjmdpt AS tanggal_sptjm,
					sisa_npdpt AS sisa_np,
					jaminan_bankdpt AS jaminan_bank,
					tanggal_jbdpt AS tanggal_jb,
					nomor_jbdpt AS nomor_jb,
					nomor_surat_kuasadpt AS nomor_surat_kuasa,
					tanggal_skdpt AS tanggal_sk,
					bankdpt AS bank,
					nomor_bankdpt AS nomor_bank,
					tanggal_bankdpt AS tanggal_bank,
					sebesar_bankdpt AS sebesar_bank,
					nomor_bast_sementaradpt AS nomor_bast_sementara,
					tanggal_bast_sementaradpt AS tanggal_bast_sementara,
					basts_file,
					sperkes_file,
					sperkes_file_penyedia,
					sperpem_file,
					sperpem_file_penyedia,
					sptjm_file,
					created_at
        FROM public.tbl_sptjmdpt
        WHERE id_paket_dptpl = $1
        ORDER BY id_sptjmdpt DESC`

	rwTblSptjm, err := db.PromiseSiplang.Query(ctx, qTblSptjm, idPaket)
	if err != nil {
		log.Fatal("qTblSptjm Failed, " + err.Error() + " " + qTblSptjm)
	}

	allTblSptjm, err2 := pgx.CollectRows(rwTblSptjm, pgx.RowToStructByName[structs.TblSptjm])
	if err2 != nil {
		log.Fatal("failed collecting rwTblSptjm (tbl_sptjm.go:GetByIPaket), " + err2.Error())
	}
	defer rwTblSptjm.Close()

	if len(allTblSptjm) > 0 {
		tblSptjm = allTblSptjm[0]
	}

	return tblSptjm
}
