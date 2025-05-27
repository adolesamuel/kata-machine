class Node<T> {
  T value;
  Node<T>? next;

  Node({required this.value, this.next});

  @override
  String toString() {
    if (next == null) return "$value";
    return "$value -> ${next.toString()}";
  }
}

void main() {
  // final node1 = Node(value: 1);
  // final node2 = Node(value: 2);
  // final node3 = Node(value: 3);

  // node1.next = node2;
  // node2.next = node3;
  // print(node1);

  final list = LinkedList<int>();
  list.push(1);
  list.append(2);
  list.append(3);
  list.append(4);
  print(list);
}

class LinkedList<E> extends Iterable<E> {
  Node<E>? head;
  Node<E>? tail;

  @override
  bool get isEmpty => head == null;

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }

  void push(E value) {
    head = Node<E>(value: value, next: head);
    tail ??= head;
  }

  void append(E value) {
    if (isEmpty) {
      push(value);
      return;
    }

    tail?.next = Node(value: value);
    tail = tail?.next;
  }

  Node<E>? nodeAt(int index) {
    var currentNode = head;
    var currentIndex = 0;
    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex++;
    }
    return currentNode;
  }

  Node<E> insertAfter(Node<E> node, E value) {
    if (tail == node) {
      append(value);
      return tail!;
    }

    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  E? pop() {
    final value = head;

    head = head?.next;
    if (isEmpty) {
      tail = null;
    }
    return value?.value;
  }

  E? removeLast() {
    if (head?.next == null) return pop();
    var current = head;
    while (current?.next != tail) {
      current = current?.next;
    }
    final value = tail?.value;
    tail = current;
    tail?.next = null;
    return value;
  }

  E? removeAfter(Node<E> node) {
    final value = node.next?.value;
    if (node.next == tail) {
      tail = node;
    }
    node.next = node.next?.next;
    return value;
  }

  @override
  Iterator<E> get iterator => _LinkedListIterator(this);
}

class _LinkedListIterator<E> implements Iterator<E> {
  _LinkedListIterator(LinkedList<E> list) : _list = list;
  final LinkedList<E> _list;

  Node<E>? _currentNode;

  @override
  E get current => _currentNode!.value;

  bool _firstPass = true;

  @override
  bool moveNext() {
    if (_list.isEmpty) return false;
    if (_firstPass) {
      _currentNode = _list.head;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?.next;
    }

    return _currentNode != null;
  }
}

extension ReversibleLinkedList<E> on LinkedList<E> {
  void reverse() {
    tail = head;
    var previous = head;
    var current = head?.next;
    previous?.next = null;
    while (current != null) {
      final next = current.next;
      current.next = previous;
      previous = current;
      current = next;
    }
  }

  void reverse2() {
    tail = head;
    var current = head?.next;
    var previous = head;
    previous?.next = null;
    while (current != null) {
      final next = current.next;
      current.next = previous;
      previous = current;
      current = next;
    }
  }

  void removeAll(E value) {
    while (head != null && head?.value == value) {
      head = head?.next;
    }
    var previous = head;
    var current = head?.next;

    while (current != null) {
      if (current.value == value) {
        previous?.next = current.next;
        current = previous?.next;
        continue;
      }
      previous = current;
      current = current.next;
    }
    if (tail?.value == value) {
      tail = previous;
    }
  }
}

void printInReverse(LinkedList<int> list) {
  if (list.isEmpty) {
    print('Empty List');
  } else {
    nodePrinter(list.head);
  }
}

void nodePrinter(Node<int>? node) {
  if (node == null) {
    return;
  }
  nodePrinter(node.next);
  print(node.value);
}

Node<int>? findTheMiddleNode(LinkedList<int> list) {
  var slow = list.head;
  var fast = list.head;

  while (fast?.next != null) {
    fast = fast?.next?.next;
    slow = slow?.next;
  }

  return slow;
}

LinkedList<int> reverseALinkedList(LinkedList<int> list) {
  final reversedList = LinkedList<int>();
  var currentNode = list.head;
  while (currentNode != null) {
    reversedList.push(currentNode.value);
    currentNode = currentNode.next;
  }
  return reversedList;
}
