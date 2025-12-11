package tblsptjmmodel

import (
	"context"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"

	"promise-migration/internal/sibela/structs"
)


func GetByIdPaket(idPaket pgtype.Int4) structs.TblSptjm {
    ctx := context.Background()

		var tblSptjm structs.TblSptjm

    qTblSptjm := `
        SELECT
            id_sptjm,
            id_paket_pl,
            tanggal_sptjm,
            sisa_np,
            jaminan_bank,
            tanggal_jb,
            nomor_jb,
            nomor_surat_kuasa,
            tanggal_sk,
            bank,
            nomor_bank,
            tanggal_bank,
            sebesar_bank,
            nomor_bast_sementara,
            tanggal_bast_sementara,
            basts_file,
            sperkes_file,
            sperkes_file_penyedia,
            sperpem_file,
            sperpem_file_penyedia,
            sptjm_file,
            created_at
        FROM public.tbl_sptjm
        WHERE id_paket_pl = $1
        ORDER BY id_sptjm DESC`

    rwTblSptjm, err := db.PromiseSibela.Query(ctx, qTblSptjm, idPaket)
    if err != nil {
        log.Fatal("qTblSptjm Failed, " + err.Error() + " " + qTblSptjm)
    }

    allTblSptjm, err2 := pgx.CollectRows(rwTblSptjm, pgx.RowToStructByName[structs.TblSptjm])
    if err2 != nil {
        log.Fatal("failed collecting rwTblSptjm (tbl_sptjm.go:GetByIPaket), " + err2.Error())
    }
    defer rwTblSptjm.Close()

		if (len(allTblSptjm) > 0) {
			tblSptjm = allTblSptjm[0]
		}

    return tblSptjm
}
