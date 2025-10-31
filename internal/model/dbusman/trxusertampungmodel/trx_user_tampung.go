package trxusertampungmodel

import (
	"context"
	"fmt"
	"log"

	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type TrxUserTampung struct {
	KodeUserTampung pgtype.Int4
	Nama            pgtype.Text
	Email           pgtype.Text
	Nip             pgtype.Text
	KodeUnitPbj     pgtype.Int4
	KodeJabatan     pgtype.Int4
	StatusAktif     pgtype.Bool
	Sk              pgtype.Text
	EncryptKey      pgtype.Text
	KodeUnit        pgtype.Text
	NamaUnit        pgtype.Text
}

func InsertNew(trxUserTampung TrxUserTampung) TrxUserTampung {
	ctx := context.Background()

	qInsert := `
	INSERT INTO trx_user_tampung (
		nama,
		email,
		nip,
		kode_unit_pbj,
		kode_jabatan,
		status_aktif,
		sk,
		encrypt_key,
		kode_unit,
		nama_unit
	) VALUES (
		@nama,
		@email,
		@nip,
		@kode_unit_pbj,
		@kode_jabatan,
		@status_aktif,
		@sk,
		@encrypt_key,
		@kode_unit,
		@nama_unit
	) RETURNING *`

	args := pgx.NamedArgs{
		"nama":          trxUserTampung.Nama,
		"email":         trxUserTampung.Email,
		"nip":           trxUserTampung.Nip,
		"kode_unit_pbj": trxUserTampung.KodeUnitPbj,
		"kode_jabatan":  trxUserTampung.KodeJabatan,
		"status_aktif":  trxUserTampung.StatusAktif,
		"sk":            trxUserTampung.Sk,
		"encrypt_key":   trxUserTampung.EncryptKey,
		"kode_unit":     trxUserTampung.KodeUnit,
		"nama_unit":     trxUserTampung.NamaUnit,
	}

	rwIns, errIns := db.DbUsman.Query(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert trx_user_tampung (trx_user_tampung.go::InsertNew), " + errIns.Error())
	}
	defer rwIns.Close()

	allTrxUserTampung, err := pgx.CollectRows(rwIns, pgx.RowToStructByName[TrxUserTampung])
	if err != nil {
		log.Fatal("failed collecting TrxUserTampung (trx_user_tampung.go::InsertNew), " + err.Error())
	}

	return allTrxUserTampung[0]
}
