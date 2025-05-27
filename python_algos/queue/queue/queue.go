package queue

type Queue[E any] interface {
	Enqueue(value *E) bool
	Dequeue() *E
	IsEmpty() bool
	Peek() E
}
