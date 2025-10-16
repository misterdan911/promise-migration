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

