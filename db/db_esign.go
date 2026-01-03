package db

import (
	"context"
	"fmt"
	"os"

	"github.com/jackc/pgx/v5/pgxpool"
)

var DbEsign *pgxpool.Pool

func ConnectDbEsign() {
	host := os.Getenv("DB_HOST")
	user := os.Getenv("DB_USERNAME")
	password := os.Getenv("DB_PASSWORD")
	dbname := os.Getenv("DB_DATABASE_ESIGN")
	port := os.Getenv("DB_PORT")

	dbUrl := "postgres://" + user + ":" + password + "@" + host + ":" + port + "/" + dbname

	var err error
	DbEsign, err = pgxpool.New(context.Background(), dbUrl)

	if err != nil {
		fmt.Fprintf(os.Stderr, "Unable to connect to database: %v\n", err)
		os.Exit(1)
	} else {
		fmt.Println("Successfully connected to database: " + dbname)
	}
}
