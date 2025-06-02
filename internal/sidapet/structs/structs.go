package structs

import "github.com/jackc/pgx/v5/pgtype"

type JawabItem struct {
	KodeItem int
	Isian    string
}

type RefDomisili struct {
	KodeDomisili pgtype.Int4
	NamaDomisili pgtype.Text
}

type VmsTblPersonaliaPerush struct {
	IdPersonalia       pgtype.Int4
	IdProfilPenyedia   pgtype.Int4
	NmPersonal         pgtype.Text
	TglPersonal        pgtype.Text
	PendidikanPersonal pgtype.Text
	JbtnPersonal       pgtype.Text
	PengalamanPersonal pgtype.Text
	KeahlianPersonal   pgtype.Text
	SertifPersonal     pgtype.Text
	PathPersonal       pgtype.Text
}

type VmsTblPaket struct {
	IdPaket           pgtype.Int4
	NamaPaket         pgtype.Text
	Metode            pgtype.Text
	IdKategoriBelanja pgtype.Int4
	IdCabang          pgtype.Int4
	TahunAnggaran     pgtype.Int4
	TglDaftarAwal     pgtype.Timestamptz
	TglDaftarAkhir    pgtype.Timestamptz
	TglEvalAwal       pgtype.Timestamptz
	TglEvalAkhir      pgtype.Timestamptz
	TglUmumPaket      pgtype.Timestamptz
	PathPaket         pgtype.Text
	CreatedAt         pgtype.Timestamptz
	UpdatedAt         pgtype.Timestamptz
	Status            pgtype.Int4
}
