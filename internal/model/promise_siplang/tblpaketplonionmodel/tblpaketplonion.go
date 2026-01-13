package tblpaketplonionmodel

import (
	"context"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type TblPaketPlOnion struct {
	IdPaket            pgtype.Int4
	IdPpk              pgtype.Int4
	IdUserpp           pgtype.Int4
	IdDireksiPerus     pgtype.Int4
	JenisPenyedia      pgtype.Text
	IdProfilPenyedia   pgtype.Int4
	IdRupUt            pgtype.Int4
	NamaPesanan        pgtype.Text
	IdKriteria         pgtype.Int4
	JenisAset          pgtype.Text
	KodeLevelAset      pgtype.Text
	IdRkaRev           pgtype.Int4
	IdPembayaran       pgtype.Int4
	PathSibela         pgtype.Text
	PathSibelaPenyedia pgtype.Text
	Total              pgtype.Text
	NegosiasiTeknispp  pgtype.Text
	NegosiasiTeknisp   pgtype.Text
	StatusPaket        pgtype.Int4
	StatusUndangan     pgtype.Int4
	StatusTermin       pgtype.Text
	Keterangan         pgtype.Text
	CreateAt           pgtype.Timestamptz
	UpdatedAt          pgtype.Timestamptz
	DeletedAt          pgtype.Timestamptz
}

func GetAllData() []TblPaketPlOnion {

	ctx := context.Background()

	qAllData := `
	SELECT 
		id_paket_pl as id_paket,
		id_ppk,
		id_userpp,
		id_direksi_perus,
		'luardpt' AS jenis_penyedia,
		id_profil_penyedia,
		id_rup_ut,
		nama_pesanan_pl as nama_pesanan,
		id_kriteria,
		jenis_aset,
		kode_level_aset,
		id_rka_rev,
		id_pembayaran,
		path_sibela_pl as path_sibela,
		path_sibela_penyedia_pl as path_sibela_penyedia,
		total,
		negosiasi_teknispp_pl as negosiasi_teknispp,
		negosiasi_teknisp_pl as negosiasi_teknisp,
		status_paket_pl as status_paket,
		status_undangan_pl as status_undangan,
		CAST(status_termin_pl AS VARCHAR(255)) as status_termin,
		keterangan,
		create_at,
		updated_at,
		deleted_at
	FROM tbl_paket_pl
	WHERE deleted_at IS NULL and id_ppk is not null
	ORDER BY id_paket ASC`

	rwData, err := db.PromiseSibela.Query(ctx, qAllData)
	if err != nil {
		log.Fatal("qAllData Failed, " + err.Error() + " " + qAllData)
	}

	allData, err2 := pgx.CollectRows(rwData, pgx.RowToStructByName[TblPaketPlOnion])
	if err2 != nil {
		log.Fatal("failed collecting rwData (tblpaketonion.go), " + err2.Error())
	}
	defer rwData.Close()

	return allData
}
