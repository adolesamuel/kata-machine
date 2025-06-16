package queue

type QueueList[E any] struct {
	list []E
}

func (ql *QueueList[E]) Enqueue(value *E) bool {
	ql.list = append(ql.list, *value)
	return true
}

func (ql *QueueList[E]) Dequeue() *E {
	if ql.IsEmpty() {
		return nil
	}
	first := ql.list[0]
	ql.list = ql.list[1:]
	//TODO remove the first element.
	return &first
}

func (ql *QueueList[E]) IsEmpty() bool {
	return len(ql.list) == 0
}

func (ql *QueueList[E]) Peek() *E {
	if ql.IsEmpty() {
		return nil
	}
	return &ql.list[0]
}
