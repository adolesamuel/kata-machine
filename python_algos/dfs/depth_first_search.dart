void dfs(Node node) {
  node.visited = true;
  print(node.name);

  for (final n in node.adjacenciesList) {
    if (!n.visited) {
      dfs(n);
    }
  }
}

void dfsIterative(Node node) {
  List<Node> stack = [];
  stack.add(node);
  node.visited = true;

  while (stack.isNotEmpty) {
    Node currentNode = stack.removeLast();
    print(currentNode.name);

    for (final n in currentNode.adjacenciesList) {
      if (!n.visited) {
        n.visited = true;
        stack.add(n);
      }
    }
  }
}

class Node {
  String name;
  List<Node> adjacenciesList;
  bool visited;

  Node({
    required this.name,
    this.visited = false,
    this.adjacenciesList = const [],
  });
}

void main(List<String> args) {
  Node nodeA = Node(name: 'A');
  Node nodeB = Node(name: 'B');
  Node nodeC = Node(name: 'C');
  Node nodeD = Node(name: 'D');
  Node nodeE = Node(name: 'E');

  // C -> A -> B -> D -> E

  nodeA.adjacenciesList = [nodeB, nodeC];
  nodeB.adjacenciesList = [nodeD, nodeE];
  nodeC.adjacenciesList = [nodeE];
  nodeD.adjacenciesList = [];
  nodeE.adjacenciesList = [];

  dfs(nodeA);
}
