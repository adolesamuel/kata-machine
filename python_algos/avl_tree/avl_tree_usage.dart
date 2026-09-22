import 'avl_tree.dart';

void main() {
  final avl = AVLTree<int>();

  // Insert values
  avl.insert(10);
  avl.insert(20);
  avl.insert(30);
  avl.insert(40);
  avl.insert(50);
  avl.insert(25);

  print("In-order traversal after insertions:");
  avl.inOrderTraversal((val) => print(val));

  // Remove a value
  avl.remove(40);

  print("In-order traversal after removing 40:");
  avl.inOrderTraversal((val) => print(val));
}
