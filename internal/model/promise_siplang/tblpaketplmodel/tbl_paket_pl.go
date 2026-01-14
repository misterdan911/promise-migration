package tblpaketplmodel

import (
	"context"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type TblPaketPl struct {
	IdPaketPl            pgtype.Int4
	IdPpk                pgtype.Int4
	IdUserpp             pgtype.Int4
	IdDireksiPerus       pgtype.Int4
	IdProfilPenyedia     pgtype.Int4
	IdRupUt              pgtype.Int4
	NamaPesananPl        pgtype.Text
	IdKriteria           pgtype.Int4
	JenisAset            pgtype.Text
	KodeLevelAset        pgtype.Text
	IdRkaRev             pgtype.Int4
	IdPembayaran         pgtype.Int4
	PathSibelaPl         pgtype.Text
	PathSibelaPenyediaPl pgtype.Text
	Total                pgtype.Text
	NegosiasiTeknisppPl  pgtype.Text
	NegosiasiTeknispPl   pgtype.Text
	StatusPaketPl        pgtype.Int4
	StatusUndanganPl     pgtype.Int4
	StatusTerminPl       pgtype.Text
	Keterangan           pgtype.Text
	CreateAt             pgtype.Timestamptz
	UpdatedAt            pgtype.Timestamptz
	DeletedAt            pgtype.Timestamptz
}

func GetAllData() []TblPaketPl {
	ctx := context.Background()

	qAllData := `
	SELECT
    id_paket_pl,
    id_ppk,
    id_userpp,
    id_direksi_perus,
    id_profil_penyedia,
    id_rup_ut,
    nama_pesanan_pl,
    id_kriteria,
    jenis_aset,
    kode_level_aset,
    id_rka_rev,
    id_pembayaran,
    path_sibela_pl,
    path_sibela_penyedia_pl,
    total,
    negosiasi_teknispp_pl,
    negosiasi_teknisp_pl,
    status_paket_pl,
    status_undangan_pl,
    status_termin_pl,
    keterangan,
    create_at,
    updated_at,
    deleted_at
  FROM tbl_paket_plPromiseSiplang
  ORDER BY id_paket_pl ASC`

	rwData, err := db.PromiseSiplang.Query(ctx, qAllData)
	if err != nil {
		log.Fatal("qAllData Failed, " + err.Error() + " " + qAllData)
	}

	allData, err2 := pgx.CollectRows(rwData, pgx.RowToStructByName[TblPaketPl])
	if err2 != nil {
		log.Fatal("failed collecting rwUser (tbl_profile_penyedia.go), " + err2.Error())
	}
	defer rwData.Close()

	return allData
}
