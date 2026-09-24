package main

import (
	"fmt"
	"time"
)

func say(s string) {
	for range 5 {
		time.Sleep(100 * time.Millisecond)
		fmt.Println(s)
	}
}

// Run with: go run ./go_practice/routines
func main() {
	go say("world")
	say("hello")
}
