class ListNode {
  int val;
  ListNode? next;
  ListNode({this.val = 0, this.next});
}

class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    ListNode baseNode = ListNode();

    ListNode? current = baseNode;
    int carry = 0;

    while (l1 != null || l2 != null || carry > 0) {
      if (l1 != null) {
        carry += l1.val;
        l1 = l1.next;
      }
      if (l2 != null) {
        carry += l2.val;
        l2 = l2.next;
      }
      current?.next = ListNode(val: carry % 10);
      current = current?.next;
      carry ~/= 10;
    }

    return baseNode.next;
  }
}
