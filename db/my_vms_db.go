package db

import (
	// "context"
	"fmt"
	"os"

	"database/sql"
    _ "github.com/go-sql-driver/mysql"
)

// var MyVmsDb *pgxpool.Pool
var MyVmsDb *sql.DB

func ConnectMyVmsDb() {
	// host := os.Getenv("DB_HOST")
	host := "127.0.0.1"
	user := os.Getenv("MYSQL_USERNAME")
	password := os.Getenv("MYSQL_PASSWORD")
	dbname := os.Getenv("DB_VMSDB")
	port := os.Getenv("MYSQL_PORT")

	// dbUrl := "postgres://" + user + ":" + password + "@" + host + ":" + port + "/" + dbname
	connetionString := user + ":" + password + "@tcp(" + host + ":" + port + ")/" + dbname

	db, err := sql.Open("mysql", connetionString)
	MyVmsDb = db
	// if err != nil {
    //     panic(err.Error())
    // }

	// var err error
	// VmsDb, err = pgxpool.New(context.Background(), dbUrl)

	if err != nil {
		fmt.Fprintf(os.Stderr, "Unable to connect to database: %v\n", err)
		os.Exit(1)
	} else {
		fmt.Println("Successfully connected to database: " + dbname)
	}
}
