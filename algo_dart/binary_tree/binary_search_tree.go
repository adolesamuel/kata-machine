package binarytree

import (
	"fmt"

	"golang.org/x/exp/constraints"
)

type BinarySearchTree[E constraints.Ordered] struct {
	Root *BinaryNode[E]
}

func (bst *BinarySearchTree[E]) String() string {
	if bst.Root == nil {
		return "[]"
	}
	var result []E
	bst.Root.TraverseInOrder(func(value E) {
		result = append(result, value)
	})
	return fmt.Sprintf("%v", result)
}

func (bst *BinarySearchTree[E]) Insert(value E) {
	bst.Root = bst.insertAt(bst.Root, value)
}

func (bst *BinarySearchTree[E]) insertAt(node *BinaryNode[E], value E) *BinaryNode[E] {
	if node == nil {
		return &BinaryNode[E]{Value: value}
	}
	if value < node.Value {
		node.LeftChild = bst.insertAt(node.LeftChild, value)
	} else {
		node.RightChild = bst.insertAt(node.RightChild, value)
	}
	return node
}

func (bst *BinarySearchTree[E]) Contains(value E) bool {
	current := bst.Root

	for current != nil {
		if current.Value == value {
			return true
		}
		if value < current.Value {
			current = current.LeftChild
		} else {
			current = current.RightChild
		}
	}

	return false
}
