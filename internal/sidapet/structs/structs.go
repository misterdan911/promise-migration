package structs

import "github.com/jackc/pgx/v5/pgtype"

type TblProfilePenyedia struct {
	IdProfilPenyedia  pgtype.Int4
	IdUser            pgtype.Int4
	IdJenisPenyedia   pgtype.Int4
	IdPaket           pgtype.Int4
	Nama              pgtype.Text
	PathKtp           pgtype.Text
	IdDomisili        pgtype.Int4
	PathDomisili      pgtype.Text
	IdCabangUt        pgtype.Int4
	Alamat            pgtype.Text
	NoTelp            pgtype.Text
	NoFax             pgtype.Text
	Email             pgtype.Text
	NmBank            pgtype.Text
	PemilikRek        pgtype.Text
	KodeBank          pgtype.Text
	NoRek             pgtype.Text
	PathRek           pgtype.Text
	Npwp              pgtype.Text
	PathNpwp          pgtype.Text
	LapUangPerus      pgtype.Text
	PathLapPerus      pgtype.Text
	PathIkutSerta     pgtype.Text
	PathKuasa         pgtype.Text
	PathSkb           pgtype.Text
	PathSkpp23        pgtype.Text
	PathPphDibebaskan pgtype.Text
	ContactPerson     pgtype.Text
	PStatus           pgtype.Int4
	Klarifikasi       pgtype.Int4
	PenyediaTerpilih  pgtype.Int4
	CreateTime        pgtype.Timestamptz
	UpdateTime        pgtype.Timestamptz
}

type User struct {
	Email    pgtype.Text
	Password pgtype.Text
}

type JawabItem struct {
	KodeItem int
	Isian    string
}

type RefDomisili struct {
	KodeDomisili pgtype.Int4
	NamaDomisili pgtype.Text
}
