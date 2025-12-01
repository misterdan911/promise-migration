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

type StatusTerminBast struct {
	NamaTermin       pgtype.Text
	StatusTerminBast pgtype.Int8
}

type TblTerminPl struct {
	IdTerminPl             pgtype.Int4
	IdPaketPl              pgtype.Int4
	NamaTermin             pgtype.Text
	PersenTermin           pgtype.Text
	StatusTerminBast       pgtype.Int4
	StatusPajak            pgtype.Int8
	SppSebelumnya          pgtype.Text
	SppIni                 pgtype.Text
	SppIniSd               pgtype.Text
	SisaPagu               pgtype.Text
	PathKwitansi           pgtype.Text
	PathBastPenyedia       pgtype.Text
	PathBastPp             pgtype.Text
	HashDokumenBast        pgtype.Text
	TerminFile             pgtype.Text
	FileScanBast           pgtype.Text
	KwitansiFile           pgtype.Text
	HashDokumenKwitansi    pgtype.Text
	SppFile                pgtype.Text
	HashDokumenSpp         pgtype.Text
	FileScanSpp            pgtype.Text
	TanggalKwitansi        pgtype.Date
	NomorKwitansi          pgtype.Text
	PathKwitansiPpk        pgtype.Text
	PathKwitansiPenyedia   pgtype.Text
	TanggalSpp             pgtype.Date
	NomorSpp               pgtype.Text
	JenisPembayaran        pgtype.Text
	SumberDana             pgtype.Text
	IDUnitLayanan          pgtype.Int8
	UnitLayanan            pgtype.Text
	TanggalBastTerealisasi pgtype.Timestamp
	CreateAt               pgtype.Timestamptz
	StatusAset             pgtype.Int8
}

type TblSuratBap struct {
    IDSuratBap     pgtype.Int4
    IDTerminPl     pgtype.Int4
    IDPkualitas    pgtype.Int4
    NomorBap       pgtype.Text
    TanggalBap     pgtype.Timestamptz
    PathBap        pgtype.Text
    NominalDenda   pgtype.Text
    BapStatus      pgtype.Text
    BapBarcode     pgtype.Text
    BapFile        pgtype.Text
    HashDokumen    pgtype.Text
    FileScanBap    pgtype.Text
    TertanggalBap  pgtype.Timestamptz
}
