package main

import "fmt"

type Node[E any] struct {
	Value E
	Next  *Node[E]
}

func (n *Node[E]) String() string {
	if n.Next == nil {
		return fmt.Sprintf("%v", n.Value)
	}
	return fmt.Sprintf("%v -> %v", n.Value, n.Next.String())
}

type LinkedList[E any] struct {
	head *Node[E]
	tail *Node[E]
}

func (list *LinkedList[E]) IsEmpty() bool {
	return list.head == nil
}

func (list *LinkedList[E]) Push(value E) {
	head := &Node[E]{
		Value: value,
		Next:  list.head,
	}
	if list.tail == nil {
		list.tail = head
	}
}

func (list *LinkedList[E]) Append(value E) {
	if list.IsEmpty() {
		list.Push(value)
		return
	}
	list.tail.Next = &Node[E]{
		Value: value,
	}

	list.tail = list.tail.Next

}

func (list *LinkedList[E]) NodeAt(index int) *Node[E] {
	currentIndex := 0
	currentNode := list.head

	for currentNode != nil && currentIndex != index {
		currentNode = currentNode.Next
		currentIndex++
	}

	return currentNode
}

func (list *LinkedList[E]) InsertAfter(node Node[E], value E) *Node[E] {
	if list.tail == &node {
		list.Append(value)
		return list.tail
	}

	node.Next = &Node[E]{Value: value, Next: node.Next}
	return node.Next
}

func (list *LinkedList[E]) Pop() E {
	value := list.head
	list.head = list.head.Next
	if list.IsEmpty() {
		list.tail = nil
	}
	return value.Value
}

func (list *LinkedList[E]) RemoveLast() E {
	if list.head.Next == nil {
		return list.Pop()
	}
	current := list.head

	for current != list.tail {
		current = current.Next
	}
	value := list.tail.Value
	list.tail = current
	current.Next = nil
	return value

}

func (list *LinkedList[E]) RemoveAfter(node *Node[E]) E {
	value := node.Next.Value
	if node.Next == list.tail {
		list.tail = node
	}
	node.Next = node.Next.Next

	return value
}
