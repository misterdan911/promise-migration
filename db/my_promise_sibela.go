package db

import (
	"fmt"
	"os"

	"database/sql"
    _ "github.com/go-sql-driver/mysql"
)

var MyPromiseSibela *sql.DB

func ConnectMyPromiseSibela() {
	// host := os.Getenv("DB_HOST")
	host := "127.0.0.1"
	user := os.Getenv("MYSQL_USERNAME")
	password := os.Getenv("MYSQL_PASSWORD")
	dbname := os.Getenv("DB_PROMISE_SIBELA")
	port := os.Getenv("MYSQL_PORT")

	connetionString := user + ":" + password + "@tcp(" + host + ":" + port + ")/" + dbname

	db, err := sql.Open("mysql", connetionString)
	MyPromiseSibela = db

	if err != nil {
		fmt.Fprintf(os.Stderr, "Unable to connect to database: %v\n", err)
		os.Exit(1)
	} else {
		fmt.Println("Successfully connected to database: " + dbname)
	}
}
