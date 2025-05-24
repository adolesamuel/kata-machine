class Vertex {
  String name;
  bool visited;
  Vertex? predecessor;
  List<Edge> adjacenciesList;
  int minDistance = double.maxFinite.toInt();

  Vertex({
    required this.name,
    this.visited = false,
    this.predecessor = null,
    this.adjacenciesList = const [],
  });
}

class Edge {
  int weight;
  Vertex start;
  Vertex target;

  Edge(this.start, this.target, this.weight);
}

void calculateShortestPath(Vertex source) {
  source.minDistance = 0;
  List<Vertex> queue = [];
  queue.add(source);

  while (queue.isNotEmpty) {
    Vertex currentVertex = queue.removeAt(0);
    currentVertex.visited = true;

    for (Edge edge in currentVertex.adjacenciesList) {
      if (!edge.target.visited) {
        int newDistance = currentVertex.minDistance + edge.weight;
        if (newDistance < edge.target.minDistance) {
          edge.target.minDistance = newDistance;
          edge.target.predecessor = currentVertex;
          queue.add(edge.target);
        }
      }
    }
  }
}

void printShortestPath(Vertex target) {
  if (target.predecessor != null) {
    printShortestPath(target.predecessor!);
  }
  print('${target.name} (${target.minDistance})');
}

void main() {
  Vertex vertexA = Vertex(name: 'A');
  Vertex vertexB = Vertex(name: 'B');
  Vertex vertexC = Vertex(name: 'C');
  Vertex vertexD = Vertex(name: 'D');
  Vertex vertexE = Vertex(name: 'E');

  vertexA.adjacenciesList = [
    Edge(vertexA, vertexB, 1),
    Edge(vertexA, vertexC, 4),
  ];
  vertexB.adjacenciesList = [
    Edge(vertexB, vertexC, 2),
    Edge(vertexB, vertexD, 5),
  ];
  vertexC.adjacenciesList = [
    Edge(vertexC, vertexD, 1),
    Edge(vertexC, vertexE, 3),
  ];
  vertexD.adjacenciesList = [Edge(vertexD, vertexE, 2)];
  vertexE.adjacenciesList = []; // No outgoing edges from E
  // Calculate shortest paths from vertex A
  calculateShortestPath(vertexA);
  print('Shortest paths from A:');
}
