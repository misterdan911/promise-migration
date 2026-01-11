package refvendorpenandatanganmodel

import (
	"context"
	"fmt"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type RefVendorPenandatangan struct {
	KodeVp          pgtype.Int4
	KodePenandatangan pgtype.Int4
	Jabatan         pgtype.Text
	FileSTugas      pgtype.Text
	KodeVendor      pgtype.Int4
	IsAktif         pgtype.Bool
	EncryptKey      pgtype.Text
}

func InsertNewIfNotExists(refVendorPenandatangan RefVendorPenandatangan) {
	ctx := context.Background()

	qInsert := `
	INSERT INTO ref_vendor_penandatangan (
		kode_penandatangan,
		jabatan,
		file_s_tugas,
		kode_vendor,
		is_aktif,
		encrypt_key
	) VALUES (
		@kode_penandatangan,
		@jabatan,
		@file_s_tugas,
		@kode_vendor,
		@is_aktif,
		@encrypt_key
	) ON CONFLICT (kode_vendor)
		DO NOTHING
	`

	args := pgx.NamedArgs{
		"kode_penandatangan": refVendorPenandatangan.KodePenandatangan,
		"jabatan":          refVendorPenandatangan.Jabatan,
		"file_s_tugas":     refVendorPenandatangan.FileSTugas,
		"kode_vendor":      refVendorPenandatangan.KodeVendor,
		"is_aktif":         refVendorPenandatangan.IsAktif,
		"encrypt_key":      refVendorPenandatangan.EncryptKey,
	}

	_, errIns := db.DbSidapet.Exec(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert ref_vendor_penandatangan, " + errIns.Error())
	}
}