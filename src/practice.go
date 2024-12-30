package practice

type ListNode struct {
	Val  int
	Next *ListNode
}

func addTwoNumbers(l1 *ListNode, l2 *ListNode) *ListNode {
	baseNode := ListNode{Val: 0}
	currentNode := baseNode
	carry := 0
	for l1 != nil || l2 != nil || carry > 0 {
		if l1 != nil {
			carry += l1.Val
			l1 = l1.Next
		}

		if l2 != nil {
			carry += l2.Val
			l2 = l2.Next
		}

		currentNode.Next = &ListNode{Val: carry % 10}
		currentNode = *currentNode.Next
		carry /= 10
	}
	return baseNode.Next
}
