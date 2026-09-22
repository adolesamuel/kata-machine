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

func AssertIterablesAreEqual(t testing.TB, got, want []int) {
	t.Helper()

	if len(got) != len(want) {
		t.Errorf("got %q is not Equal to %q", got, want)
	} else {
		for index, val := range got {
			if val != want[index] {
				t.Errorf("got %q is not Equal to %q", got, want)
				break
			}
		}
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
