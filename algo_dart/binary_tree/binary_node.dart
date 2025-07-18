import 'dart:math';

class BinaryNode<T> {
  T? value;
  BinaryNode<T>? leftChild;
  BinaryNode<T>? rightChild;

  BinaryNode({this.value, this.leftChild, this.rightChild});

  @override
  String toString() {
    return _diagram(this);
  }

  String _diagram(
    BinaryNode<T>? node, [
    String top = '',
    String root = '',
    String bottom = '',
  ]) {
    if (node == null) {
      return '$root null\n';
    }
    if (node.leftChild == null && node.rightChild == null) {
      return '$root ${node.value}\n';
    }
    final a = _diagram(node.rightChild, '$top ', '$top ----', '$top |  ');
    final b = '$root${node.value}\n';
    final c = _diagram(
      node.leftChild,
      '$bottom|',
      '$bottom-----',
      '$bottom    ',
    );
    return '$a$b$c';
  }

  void traverseInOrder(void Function(T? value) action) {
    leftChild?.traverseInOrder(action);
    action(value);
    rightChild?.traverseInOrder(action);
  }

  void traversePreOrder(void Function(T? value) action) {
    action(value);
    leftChild?.traversePreOrder(action);
    rightChild?.traversePreOrder(action);
  }

  void traversePostOrder(void Function(T? value) action) {
    leftChild?.traversePostOrder(action);
    rightChild?.traversePostOrder(action);
    action(value);
  }
}

int heightOfBinaryTree<T>(BinaryNode<T>? node) {
  if (node == null) {
    return -1;
  }
  return 1 +
      max(
        heightOfBinaryTree(node.leftChild),
        heightOfBinaryTree(node.rightChild),
      );
}
