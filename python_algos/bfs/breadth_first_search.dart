import 'dart:collection';

class BreadthFirstSearch {
  List<Vertex> bfs(Vertex start) {
    List<Vertex> visitedOrder = [];
    Queue<Vertex> queue = Queue<Vertex>();
    queue.add(start);
    start.setVisited(true);

    while (queue.isNotEmpty) {
      Vertex current = queue.removeFirst();
      visitedOrder.add(current);

      for (Vertex neighbor in current.getNeighbors()) {
        if (!neighbor.isVisited()) {
          neighbor.setVisited(true);
          queue.add(neighbor);
        }
      }
    }
    return visitedOrder;
  }

  List<Vertex> bfs2(Vertex start) {
    List<Vertex> visitedOrder = [];
    List<Vertex> queue = [];

    queue.add(start);
    start.setVisited(true);

    while (queue.isNotEmpty) {
      final current = queue.first;
      queue.removeAt(0);
      visitedOrder.add(current);

      for (final v in current.neighbors) {
        if (!v.isVisited()) {
          v.setVisited(true);
          queue.add(v);
        }
      }
    }

    return visitedOrder;
  }
}

class Vertex {
  int data;
  bool visited;
  List<Vertex> neighbors;
  Vertex(this.data) : visited = false, neighbors = [];
  void addNeighbor(Vertex vertex) {
    neighbors.add(vertex);
  }

  void removeNeighbor(Vertex vertex) {
    neighbors.remove(vertex);
  }

  int getData() {
    return data;
  }

  set setData(int data) {
    this.data = data;
  }

  bool isVisited() {
    return visited;
  }

  void setVisited(bool visited) {
    this.visited = visited;
  }

  List<Vertex> getNeighbors() {
    return neighbors;
  }
}
