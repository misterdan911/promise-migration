package db

import (
	"context"
	"fmt"
	"github.com/jackc/pgx/v5/pgxpool"
	"os"
)

var DbSidapet *pgxpool.Pool

func ConnectDbSidapet() {
	host := os.Getenv("DB_HOST")
	user := os.Getenv("DB_USERNAME")
	password := os.Getenv("DB_PASSWORD")
	dbname := os.Getenv("DB_DATABASE_SIDAPET")
	port := os.Getenv("DB_PORT")

	dbUrl := "postgres://" + user + ":" + password + "@" + host + ":" + port + "/" + dbname

	var err error
	DbSidapet, err = pgxpool.New(context.Background(), dbUrl)

	if err != nil {
		fmt.Fprintf(os.Stderr, "Unable to connect to database: %v\n", err)
		os.Exit(1)
	} else {
		fmt.Println("Successfully connected to database: " + dbname)
	}
}
