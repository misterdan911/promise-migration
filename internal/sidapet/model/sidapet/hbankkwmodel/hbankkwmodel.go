package hbankkwmodel

import (
	"context"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
	"strings"
)

type BankKw struct {
	Keyword   pgtype.Text
	SandiBank pgtype.Text
}

func GetSandiBankByArbitaryText(text string) string {
	var sandiBank string
	ctx := context.Background()
	qBankKw := `SELECT keyword, sandi_bank FROM helper_bank_kw ORDER BY id ASC`
	rwBankKw, err := db.DbSidapet.Query(ctx, qBankKw)
	if err != nil {
		log.Fatal("qBankKw Failed, " + err.Error() + " " + qBankKw)
	}

	allBankKw, err := pgx.CollectRows(rwBankKw, pgx.RowToStructByName[BankKw])
	if err != nil {
		log.Fatal("failed collecting rwBankKw, " + err.Error())
	}
	defer rwBankKw.Close()

	for _, bankKw := range allBankKw {
		mainString := strings.ToLower(text)
		substring := bankKw.Keyword.String
		contains := strings.Contains(mainString, substring)

		if contains {
			sandiBank = bankKw.SandiBank.String
			return sandiBank
		}
	}

	return sandiBank
}
