package main

import "fmt"

func printInReverse(list LinkedList[int]) {
	answers := []int{}
	currentNode := list.head
	for currentNode != nil {
		answers = append(answers, currentNode.Value)
		currentNode = currentNode.Next
	}

	for i := len(answers); i > 0; i-- {
		fmt.Println(answers[i])
	}
}

func main() {
	list := LinkedList[int]{}
	list.Push(1)
	list.Append(2)
	list.Append(3)
	list.Append(4)
	// fmt.Println(list)
	printInReverse(list)

}
