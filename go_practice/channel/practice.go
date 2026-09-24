package main

import (
	"fmt"
	"sync"
	"time"
)

func longRunningFunc(i int, ch chan<- string, wg *sync.WaitGroup) {

	defer wg.Done()
	time.Sleep(100 * time.Millisecond)
	ch <- fmt.Sprintf("Current function: %v", i)

}

func main() {
	startTime := time.Now()
	ch := make(chan string)
	var wg sync.WaitGroup

	for i := range 5 {
		wg.Add(1)
		go longRunningFunc(i, ch, &wg)
	}

	go func() {
		wg.Wait()
		close(ch)
	}()

	for result := range ch {
		fmt.Println(result)
	}

	fmt.Println("This operation took:", time.Since(startTime))

}
