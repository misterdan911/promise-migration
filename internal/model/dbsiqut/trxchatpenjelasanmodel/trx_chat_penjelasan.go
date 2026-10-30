package trxchatpenjelasanmodel

import (
	"context"
	"log"
	// "time"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"

	"promise-migration/db"
)

// TrxChatPenjelasan represents a row in public.trx_chat_penjelasan
type TrxChatPenjelasan struct {
	KodeChat       pgtype.Int4
	KodePenjelasan pgtype.Int4
	KodeVendor     pgtype.Int4
	Tanya          pgtype.Text
	Jawab          pgtype.Text
	Udcr           pgtype.Timestamp
	Udch           pgtype.Timestamp
	TanggalJawab   pgtype.Timestamp
	IsReplied      pgtype.Bool
}

// InsertNew inserts a new row into trx_chat_penjelasan and returns the inserted row.
func InsertNew(trxChatPenjelasan TrxChatPenjelasan) TrxChatPenjelasan {
	ctx := context.Background()

	qIns := `
	INSERT INTO public.trx_chat_penjelasan(
		kode_penjelasan,
		kode_vendor,
		tanya,
		jawab,
		udcr,
		udch,
		tanggal_jawab,
		is_replied
	) VALUES (
		@kode_penjelasan,
		@kode_vendor,
		@tanya,
		@jawab,
		@udcr,
		@udch,
		@tanggal_jawab,
		@is_replied
	) RETURNING
		kode_chat,
		kode_penjelasan,
		kode_vendor,
		tanya,
		jawab,
		udcr,
		udch,
		tanggal_jawab,
		is_replied`

	args := pgx.NamedArgs{
		"kode_penjelasan": trxChatPenjelasan.KodePenjelasan,
		"kode_vendor":     trxChatPenjelasan.KodeVendor,
		"tanya":           trxChatPenjelasan.Tanya,
		"jawab":           trxChatPenjelasan.Jawab,
		"udcr":            trxChatPenjelasan.Udcr,
		"udch":            trxChatPenjelasan.Udch,
		"tanggal_jawab":   trxChatPenjelasan.TanggalJawab,
		"is_replied":      trxChatPenjelasan.IsReplied,
	}

	rwIns, errIns := db.DbSiqut.Query(ctx, qIns, args)
	if errIns != nil {
		log.Fatal("unable to insert trx_chat_penjelasan, " + errIns.Error())
	}
	defer rwIns.Close()

	allRows, errRwIns := pgx.CollectRows(rwIns, pgx.RowToStructByName[TrxChatPenjelasan])
	if errRwIns != nil {
		log.Fatal("failed collecting TrxChatPenjelasan (trx_chat_penjelasan.go), " + errRwIns.Error())
	}

	if len(allRows) == 0 {
		log.Fatal("no rows returned after insert into trx_chat_penjelasan")
	}

	return allRows[0]
}
