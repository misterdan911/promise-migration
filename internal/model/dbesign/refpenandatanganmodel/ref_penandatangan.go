package refpenandatanganmodel

import (
	"context"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type RefPenandatangan struct {
	KodePenandatangan         pgtype.Int4
	KodeKelompokPenandatangan pgtype.Int2
	Nama                      pgtype.Text
	Email                     pgtype.Text
	NoHp                      pgtype.Text
	Nip                       pgtype.Text
	Nik                       pgtype.Text
	ScanKtp                   pgtype.Text
	KodeVendor                pgtype.Int4
	KodeDireksiPerus          pgtype.Int4
	JabatanDireksi            pgtype.Text
	StatusPermohonan          pgtype.Text
	AlasanDitolak             pgtype.Text
	UserVerif                 pgtype.Text
	Pin                       pgtype.Text
	Tte                       pgtype.Text
	ResetToken                pgtype.Text
	TokenExpiredTime          pgtype.Timestamptz
	IsUserAktif               pgtype.Bool
	UserPenonaktif            pgtype.Text
	AlasanPenonaktifan        pgtype.Text
	Udcr                      pgtype.Timestamptz
	Udch                      pgtype.Timestamptz
}

func GetAllData() []RefPenandatangan {
	var allRefPenandatangan []RefPenandatangan
	ctx := context.Background()

	qSelect := `SELECT * FROM ref_penandatangan`

	rwRefPenandatangan, err := db.DbEsign.Query(ctx, qSelect)
	if err != nil {
		log.Fatal("qSelect Failed, " + err.Error() + " " + qSelect)
	}

	allRefPenandatangan, err = pgx.CollectRows(rwRefPenandatangan, pgx.RowToStructByName[RefPenandatangan])
	if err != nil {
		log.Fatal("failed collecting rwRefPenandatangan (refpenandatangan.go:GetByEmail), " + err.Error())
	}
	defer rwRefPenandatangan.Close()

	return allRefPenandatangan
}

func GetByEmail(email pgtype.Text) RefPenandatangan {
	var refPenandatangan RefPenandatangan
	ctx := context.Background()

	qRefPenandatangan := `
	SELECT
		kode_penandatangan,
		kode_kelompok_penandatangan,
		nama,
		email,
		no_hp,
		nip,
		nik,
		scan_ktp,
		kode_vendor,
		kode_direksi_perus,
		jabatan_direksi,
		status_permohonan,
		alasan_ditolak,
		user_verif,
		pin,
		tte,
		reset_token,
		token_expired_time,
		is_user_aktif,
		user_penonaktif,
		alasan_penonaktifan,
		udcr,
		udch
	FROM ref_penandatangan rp
	WHERE email = $1`

	rwRefPenandatangan, err := db.DbEsign.Query(ctx, qRefPenandatangan, email)
	if err != nil {
		log.Fatal("qRefPenandatangan Failed, " + err.Error() + " " + qRefPenandatangan)
	}

	allPenandatangan, err := pgx.CollectRows(rwRefPenandatangan, pgx.RowToStructByName[RefPenandatangan])
	if err != nil {
		log.Fatal("failed collecting rwRefPenandatangan (refpenandatangan.go:GetByEmail), " + err.Error())
	}
	defer rwRefPenandatangan.Close()

	if len(allPenandatangan) > 0 {
		refPenandatangan = allPenandatangan[0]
	}

	return refPenandatangan
}
