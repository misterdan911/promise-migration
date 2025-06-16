package refvendormodel

import "github.com/jackc/pgx/v5/pgtype"

type RefVendor struct {
	KodeVendor        pgtype.Int4
	KodeJenisVendor   pgtype.Int4
	NamaPerusahaan    pgtype.Text
	IsTetap           pgtype.Bool
	StatusFormLuarDpt pgtype.Text
	Udcr              pgtype.Timestamptz
	Udch              pgtype.Timestamptz
}

// func InsertNew(refVendor)