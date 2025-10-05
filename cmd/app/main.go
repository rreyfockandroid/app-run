package main

import (
	"log"
	"time"
)

func main() {
	log.Println("start")
	max := 60
	for i := 0; i < max; i++ {
		time.Sleep(time.Second)
		log.Println("execute ", i+1)
	}
	log.Println("stop")
}