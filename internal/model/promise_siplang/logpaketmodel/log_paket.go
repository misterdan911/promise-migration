package logpaketmodel

import (
	"context"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type LogPaket struct {
	IdLogPaket pgtype.Int8
	IdPpk      pgtype.Int8
	IdUser     pgtype.Int4
	NamaPp     pgtype.Text
	IdPaket    pgtype.Int8
	JenisPaket pgtype.Text
	CreatedAt  pgtype.Timestamptz
}

func GetByIdPaket(idPaket pgtype.Int4) []LogPaket {
	ctx := context.Background()

	qLogPaket := `
	SELECT
		id_log_paket,
		id_ppk,
		id_user,
		nama_pp,
		id_paket,
		jenis_paket,
		created_at
	FROM log_paket
	WHERE id_paket = $1`

	rwLogPaket, err := db.PromiseSiplang.Query(ctx, qLogPaket, idPaket)
	if err != nil {
		log.Fatal("qLogPaket Failed, " + err.Error() + " " + qLogPaket)
	}

	allLogPaket, err2 := pgx.CollectRows(rwLogPaket, pgx.RowToStructByName[LogPaket])
	if err2 != nil {
		log.Fatal("failed collecting rwLogPaket (log_paket.go:GetByIdPaket), " + err2.Error())
	}
	defer rwLogPaket.Close()

	return allLogPaket
}

func GetPP(idPpk pgtype.Int4, idPaket pgtype.Int4) []LogPaket {
	ctx := context.Background()

	qLogPaket := `
	SELECT
		id_log_paket,
		id_ppk,
		id_user,
		nama_pp,
		id_paket,
		jenis_paket,
		created_at
	FROM log_paket
	WHERE
	id_paket = $1
	and id_ppk = $2`

	rwLogPaket, err := db.PromiseSiplang.Query(ctx, qLogPaket, idPaket, idPpk)
	if err != nil {
		log.Fatal("qLogPaket Failed, " + err.Error() + " " + qLogPaket)
	}

	allLogPaket, err2 := pgx.CollectRows(rwLogPaket, pgx.RowToStructByName[LogPaket])
	if err2 != nil {
		log.Fatal("failed collecting rwLogPaket (log_paket.go:GetByIdPaket), " + err2.Error())
	}
	defer rwLogPaket.Close()

	return allLogPaket
}