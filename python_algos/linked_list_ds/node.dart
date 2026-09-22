class Node {
  int data;
  Node? next;

  Node(this.data);

  void remove() {
    if (next != null) {
      next = next!.next;
    }
  }
}
