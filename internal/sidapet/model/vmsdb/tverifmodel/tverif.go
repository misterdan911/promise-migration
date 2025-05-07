package tverifmodel

import "github.com/jackc/pgx/v5/pgtype"

type TblVerif struct {
	IdVerif            pgtype.Int4
	IdProfil           pgtype.Int4
	IdPaket            pgtype.Int4
	IdPegawai          pgtype.Int4
	StatusVerif        pgtype.Int4
	OrgDataPribadi     pgtype.Int4
	OrgNpwpPribadi     pgtype.Int4
	OrgPengalaman      pgtype.Float8
	OrgSertifikat      pgtype.Float8
	PerusLandasanHukum pgtype.Int4
	PerusPengurus      pgtype.Int4
	PerusIzinUsaha     pgtype.Int4
	PerusDataKeuangan  pgtype.Int4
	PerusPersonalia    pgtype.Float8
	PerusFasilitas     pgtype.Float8
	PerusPengalaman    pgtype.Float8
	PerusLapKeuangan   pgtype.Float8
	TotalNilai         pgtype.Float8
	Terpilih           pgtype.Int4
}
