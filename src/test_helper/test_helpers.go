package test

import (
	"context"
	"testing"
	"time"
)

func AssertCorrectMessage(t testing.TB, got, want any) {
	t.Helper()
	if got != want {
		t.Errorf("got %q want %q", got, want)
	}
}

func RunTestsWithTimeOut(t testing.TB, testFunction func()) {
	t.Helper()
	timeout := 2 * time.Second

	ctx, cancel := context.WithTimeout(context.Background(), timeout)
	defer cancel()

	done := make(chan bool)
	go func() {
		testFunction()
		done <- true
	}()

	select {
	case <-ctx.Done():
		t.Error("Test timed out")
	case <-done:
		// Test completed successfully within the timeout
	}

}
