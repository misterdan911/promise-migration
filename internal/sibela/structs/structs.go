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
	IDSuratpesananPl    pgtype.Int4
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
	TanggalKwitansi        pgtype.Timestamp
	NomorKwitansi          pgtype.Text
	PathKwitansiPpk        pgtype.Text
	PathKwitansiPenyedia   pgtype.Text
	TanggalSpp             pgtype.Timestamp
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
    IdSuratBap     pgtype.Int4
    IdTerminPl     pgtype.Int4
    IdPkualitas    pgtype.Int4
    NomorBap       pgtype.Text
    TanggalBap     pgtype.Timestamp
    PathBap        pgtype.Text
    NominalDenda   pgtype.Numeric
    BapStatus      pgtype.Text
    BapBarcode     pgtype.Text
    BapFile        pgtype.Text
    HashDokumen    pgtype.Text
    FileScanBap    pgtype.Text
    TertanggalBap  pgtype.Timestamptz
}

type TblBaserahterimaPl struct {
	IdBaserahterimaPl pgtype.Int8
	IdTerminPl        pgtype.Int8
	IdPpkualitas      pgtype.Int8
	NomorSt           pgtype.Text
	NomorSkrek        pgtype.Text
	TanggalSt         pgtype.Timestamp
	KedudukanSkrek    pgtype.Text
	TertanggalSt      pgtype.Timestamptz
}

type TblSptjm struct {
	IdSptjm              pgtype.Int8
	IdPaketPl            pgtype.Int8
	TanggalSptjm         pgtype.Timestamp
	SisaNp               pgtype.Int8
	JaminanBank          pgtype.Text
	TanggalJb            pgtype.Timestamptz
	NomorJb              pgtype.Text
	NomorSuratKuasa      pgtype.Text
	TanggalSk            pgtype.Timestamptz
	Bank                 pgtype.Text
	NomorBank            pgtype.Text
	TanggalBank          pgtype.Timestamptz
	SebesarBank          pgtype.Numeric
	NomorBastSementara   pgtype.Text
	TanggalBastSementara pgtype.Timestamp
	BastsFile            pgtype.Text
	SperkesFile          pgtype.Text
	SperkesFilePenyedia  pgtype.Text
	SperpemFile         pgtype.Text
	SperpemFilePenyedia pgtype.Text
	SptjmFile            pgtype.Text
	CreatedAt            pgtype.Timestamptz
}

type TblSptbPl struct {
	IDSptbPl                 pgtype.Int4
	IDTerminPl               pgtype.Int8
	NomorSptb                pgtype.Text
	JenisObjekPajak          pgtype.Text
	JenisPengadaan           pgtype.Text
	NilaiPerhitungan         pgtype.Text
	DppPpn                   pgtype.Text
	DppPph                   pgtype.Text
	PpnSptb                  pgtype.Text
	PphSptb                  pgtype.Text
	JenisPph                 pgtype.Text
	IDObjekPajak             pgtype.Int8
	Additional               pgtype.Text
	DokNonPkp                pgtype.Text
	DokKetentuanKhusus       pgtype.Text
	DokKetentuanKhususJenis  pgtype.Text
	KetentuanKhusus          pgtype.Text
	KetentuanKhususKeterangan pgtype.Text
	KetentuanKhususDpp       pgtype.Text
	KetentuanKhususJenis     pgtype.Text
	SptbFile                 pgtype.Text
	HashDokumenSptb          pgtype.Text
	FileScanSptb             pgtype.Text
	RingkasankontrakFile     pgtype.Text
	HashDokumenRingkasankontrak pgtype.Text
	FileScanRk               pgtype.Text
	NomorFakturPajak         pgtype.Text
	TanggalFakturPajak       pgtype.Text
	FakturPajakFile          pgtype.Text
	HashDokumenFakturPajak   pgtype.Text
	SspFile                  pgtype.Text
	HashDokumenSsp           pgtype.Text
	PpnPersen                pgtype.Text
	PphPersen                pgtype.Text
	Transaksi                pgtype.Text
	TertanggalSptb           pgtype.Timestamp
}
