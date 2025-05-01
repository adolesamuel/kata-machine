class AVLNode<T extends Comparable> {
  T value;
  AVLNode<T>? left;
  AVLNode<T>? right;
  int height;

  AVLNode(this.value) : height = 1;
}

class AVLTree<T extends Comparable> {
  AVLNode<T>? root;

  int _height(AVLNode<T>? node) => node?.height ?? 0;

  int _balanceFactor(AVLNode<T>? node) =>
      node == null ? 0 : _height(node.left) - _height(node.right);

  AVLNode<T> _rotateRight(AVLNode<T> y) {
    final x = y.left!;
    final T2 = x.right;

    x.right = y;
    y.left = T2;

    y.height = 1 + _max(_height(y.left), _height(y.right));
    x.height = 1 + _max(_height(x.left), _height(x.right));

    return x;
  }

  AVLNode<T> _rotateLeft(AVLNode<T> x) {
    final y = x.right!;
    final T2 = y.left;

    y.left = x;
    x.right = T2;

    x.height = 1 + _max(_height(x.left), _height(x.right));
    y.height = 1 + _max(_height(y.left), _height(y.right));

    return y;
  }

  int _max(int a, int b) => (a > b) ? a : b;

  AVLNode<T> _insert(AVLNode<T>? node, T value) {
    if (node == null) return AVLNode(value);

    if (value.compareTo(node.value) < 0) {
      node.left = _insert(node.left, value);
    } else if (value.compareTo(node.value) > 0) {
      node.right = _insert(node.right, value);
    } else {
      return node; // Duplicate values not allowed
    }

    node.height = 1 + _max(_height(node.left), _height(node.right));
    return _balance(node, value);
  }

  AVLNode<T> _balance(AVLNode<T> node, T value) {
    final balance = _balanceFactor(node);

    if (balance > 1 && value.compareTo(node.left!.value) < 0) {
      return _rotateRight(node);
    }

    if (balance < -1 && value.compareTo(node.right!.value) > 0) {
      return _rotateLeft(node);
    }

    if (balance > 1 && value.compareTo(node.left!.value) > 0) {
      node.left = _rotateLeft(node.left!);
      return _rotateRight(node);
    }

    if (balance < -1 && value.compareTo(node.right!.value) < 0) {
      node.right = _rotateRight(node.right!);
      return _rotateLeft(node);
    }

    return node;
  }

  void insert(T value) {
    root = _insert(root, value);
  }

  AVLNode<T>? _minValueNode(AVLNode<T> node) {
    AVLNode<T> current = node;
    while (current.left != null) {
      current = current.left!;
    }
    return current;
  }

  AVLNode<T>? _remove(AVLNode<T>? root, T key) {
    if (root == null) return null;

    if (key.compareTo(root.value) < 0) {
      root.left = _remove(root.left, key);
    } else if (key.compareTo(root.value) > 0) {
      root.right = _remove(root.right, key);
    } else {
      if (root.left == null || root.right == null) {
        final temp = root.left ?? root.right;
        if (temp == null) return null;
        return temp;
      } else {
        final temp = _minValueNode(root.right!)!;
        root.value = temp.value;
        root.right = _remove(root.right, temp.value);
      }
    }

    root.height = 1 + _max(_height(root.left), _height(root.right));

    final balance = _balanceFactor(root);

    if (balance > 1 && _balanceFactor(root.left) >= 0) {
      return _rotateRight(root);
    }

    if (balance > 1 && _balanceFactor(root.left) < 0) {
      root.left = _rotateLeft(root.left!);
      return _rotateRight(root);
    }

    if (balance < -1 && _balanceFactor(root.right) <= 0) {
      return _rotateLeft(root);
    }

    if (balance < -1 && _balanceFactor(root.right) > 0) {
      root.right = _rotateRight(root.right!);
      return _rotateLeft(root);
    }

    return root;
  }

  void remove(T value) {
    root = _remove(root, value);
  }

  void _inOrder(AVLNode<T>? node, void Function(T value) visit) {
    if (node == null) return;
    _inOrder(node.left, visit);
    visit(node.value);
    _inOrder(node.right, visit);
  }

  void inOrderTraversal(void Function(T value) visit) {
    _inOrder(root, visit);
  }
}
