package binarytree

type BinaryNode[E any] struct {
	Value      E
	LeftChild  *BinaryNode[E]
	RightChild *BinaryNode[E]
}

func (b *BinaryNode[E]) TraverseInOrder(action func(value E)) {
	if b.LeftChild != nil {
		b.LeftChild.TraverseInOrder(action)
	}
	action(b.Value)
	if b.RightChild != nil {
		b.RightChild.TraverseInOrder(action)
	}
}

func (b *BinaryNode[E]) TraversePreOrder(action func(value E)) {
	action(b.Value)
	if b.LeftChild != nil {
		b.LeftChild.TraversePreOrder(action)
	}
	if b.RightChild != nil {
		b.RightChild.TraversePreOrder(action)
	}
}

func (b *BinaryNode[E]) TraversePostOrder(action func(value E)) {
	if b.LeftChild != nil {
		b.LeftChild.TraversePostOrder(action)
	}
	if b.RightChild != nil {
		b.RightChild.TraversePostOrder(action)
	}
	action(b.Value)

}

type T any

func heightOfABinaryTree(node *BinaryNode[T]) int {
	if node == nil {
		return -1
	}
	return 1 + max(heightOfABinaryTree(node.LeftChild),
		heightOfABinaryTree(node.RightChild))

}
