package main

import (
	"github.com/joho/godotenv"
	"log"
	"promise-migration/cmd"
)

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file: " + err.Error())
	}

	cmd.Execute()
}
