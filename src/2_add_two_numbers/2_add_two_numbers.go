package addtwonumbers

/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func addTwoNumbers(l1 *ListNode, l2 *ListNode) *ListNode {
	dummy := ListNode{}
	current := &dummy
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

		current.Next = &ListNode{Val: carry % 10}
		carry /= 10
		current = current.Next

	}

	return dummy.Next

}

type ListNode struct {
	Val  int
	Next *ListNode
}

//1
//2
//3
//4
