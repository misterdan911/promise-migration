package structs

import (
	"github.com/jackc/pgx/v5/pgtype"
)

type TblPesanan struct {
	IDPesanan     pgtype.Int4
	IDPaket       pgtype.Int4
	KodeBMN       pgtype.Text
	KodeRuang     pgtype.Text
	NamaBarang    pgtype.Text
	Kuantitas     pgtype.Text
	SatuanUkuran  pgtype.Text
	HargaSatuan   pgtype.Text
	Negosiasi     pgtype.Text
	TotalHarga    pgtype.Text
	StatusPesanan pgtype.Int4
}

type TblUndanganPl struct {
	IdUndanganPl   pgtype.Int8
	IdPaketPl      pgtype.Int8
	NomorPl        pgtype.Text
	BanegoFile     pgtype.Text
	HashDokumen    pgtype.Text
	FileScanBanego pgtype.Text
	TanggalPl      pgtype.Timestamptz
	SphPl          pgtype.Text
	TertanggalPl   pgtype.Timestamptz
}

type TblSuratpesananPl struct {
	IDSuratpesananPl    pgtype.Int8
	IDPaketPl           pgtype.Int8
	NomorpesananSp      pgtype.Text
	TanggalSp           pgtype.Timestamptz
	SuratpesananStatus  pgtype.Text
	SuratpesananBarcode pgtype.Text
	SuratpesananFile    pgtype.Text
	HashDokumen         pgtype.Text
	FileScanSp          pgtype.Text
	TempatSp            pgtype.Text
	SdrSp               pgtype.Text
	NomorTeleponSdr     pgtype.Text
	AlamatSdr           pgtype.Text
	TertanggalSp        pgtype.Timestamptz
}
