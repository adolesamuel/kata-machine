class Stack<E> {
  final List<E> _storage;

  Stack() : _storage = <E>[];

  Stack.of(Iterable<E> elements) : _storage = List<E>.of(elements);

  @override
  String toString() {
    return '---Top---\n'
        '${_storage.reversed.join('\n')}'
        '\n---------------';
  }

  void push(E element) => _storage.add(element);
  E pop() => _storage.removeLast();

  E get peek => _storage.last;
  bool get isEmpty => _storage.isEmpty;
  bool get isNotEmpty => _storage.isNotEmpty;
}

void reverseList(List<int> data) {
  Stack<int> collection = Stack<int>();
  final result = [];

  for (final item in data) {
    collection.push(item);
  }
  while (collection.isNotEmpty) {
    result.add(collection.pop());
  }
  print(result);
}

void balanceParenthesis(String word) {
  final collection = Stack<String>();
  for (int i = 0; i < word.length; i++) {
    if (word[i] == '(') {
      collection.push('(');
    } else if (word[i] == ')') {
      collection.pop();
    }
  }
  print('Is $word balance: ${collection.isEmpty}');
}
