package trxdetailpenandatanganmodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type TrxDetailPenandatangan struct {
	KodeDetailPenandatangan   pgtype.Int4
	KodeTrxPenandatangan      pgtype.Int4
	StatusJabatanPenandatangan pgtype.Text // Assuming this maps to status_jabatan_penandatangan enum
	Jabatan                   pgtype.Text
	StatusPenandatangan       pgtype.Text // Assuming this maps to status_penandatangan enum
	TglTte                    pgtype.Timestamptz
	KodePenandatangan         pgtype.Int4
	Otp                       pgtype.Text
	ExpiredOtp                pgtype.Timestamp
}

func InsertNew(trxDetailPenandatangan TrxDetailPenandatangan) TrxDetailPenandatangan {
	ctx := context.Background()

	qInsert := `
	INSERT INTO trx_detail_penandatangan (
		kode_trx_penandatangan,
		status_jabatan_penandatangan,
		jabatan,
		status_penandatangan,
		tgl_tte,
		kode_penandatangan,
		otp,
		expired_otp
	) VALUES (
		@kode_trx_penandatangan,
		@status_jabatan_penandatangan,
		@jabatan,
		@status_penandatangan,
		@tgl_tte,
		@kode_penandatangan,
		@otp,
		@expired_otp
	) RETURNING *`

	args := pgx.NamedArgs{
		"kode_trx_penandatangan":        trxDetailPenandatangan.KodeTrxPenandatangan,
		"status_jabatan_penandatangan":  trxDetailPenandatangan.StatusJabatanPenandatangan,
		"jabatan":                      trxDetailPenandatangan.Jabatan,
		"status_penandatangan":         trxDetailPenandatangan.StatusPenandatangan,
		"tgl_tte":                      trxDetailPenandatangan.TglTte,
		"kode_penandatangan":           trxDetailPenandatangan.KodePenandatangan,
		"otp":                          trxDetailPenandatangan.Otp,
		"expired_otp":                  trxDetailPenandatangan.ExpiredOtp,
	}

	rwIns, errIns := db.DbEsign.Query(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert trx_detail_penandatangan, " + errIns.Error())
	}
	defer rwIns.Close()

	allTrxDetailPenandatangan, err := pgx.CollectRows(rwIns, pgx.RowToStructByName[TrxDetailPenandatangan])
	if err != nil {
		log.Fatal("failed collecting TrxDetailPenandatangan, " + err.Error())
	}

	return allTrxDetailPenandatangan[0]
}
