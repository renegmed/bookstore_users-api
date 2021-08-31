package main

import (
	"flag"
	"log"
	"os"

	"bookstore_users-api/app"
)

var usageStr = `
Usage: stan-pub [options] <subject> <message>

Options:
	-a,  --addr   Server URL example: localhost:8080 
	 
`

func usage() {
	log.Printf("%s\n", usageStr)
	os.Exit(0)
}

func main() {
	var (
		addr string
	)

	flag.StringVar(&addr, "a", "localhost:8082", "This server address")
	flag.StringVar(&addr, "addr", "localhost:8082", "This server address")

	flag.Usage = usage
	flag.Parse()

	app.StartApplication(addr)
}
