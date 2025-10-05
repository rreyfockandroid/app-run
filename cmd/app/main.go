package main

import (
	"log"
	"time"
)

func main() {
	log.Println("started run app")
	max := 5
	for i := 0; i < max; i++ {
		time.Sleep(time.Second)
		log.Println(" -execute ", i+1)
	}
	log.Println("stoped run app")
}