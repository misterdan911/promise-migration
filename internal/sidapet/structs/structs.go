package structs

import "github.com/jackc/pgx/v5/pgtype"

type TblProfilePenyedia struct {
	Email            pgtype.Text
	IdUser           pgtype.Int4
	IdProfilPenyedia pgtype.Int4
	IdJenisPenyedia  pgtype.Int4
	Nama             pgtype.Text
	PenyediaTerpilih pgtype.Int4
	CreateTime       pgtype.Timestamptz
	UpdateTime       pgtype.Timestamptz
}

type User struct {
	Email    pgtype.Text
	Password pgtype.Text
}

type JawabItem struct {
	KodeItem int
	Isian    string
}
