class Vertex<T> {
  final T data;
  final int index;

  Vertex({required this.data, required this.index});

  @override
  String toString() {
    return '$data';
  }
}

class Edge<T> {
  final Vertex<T> source;
  final Vertex<T> destination;
  final double? weight;
  Edge({required this.source, required this.destination, this.weight});
}

enum EdgeType { directed, undirected }

abstract class Graph<E> {
  Iterable<Vertex<E>> get vertices;
  Vertex<E> createVertex(E data);

  void addEdge(
    Vertex<E> source,
    Vertex<E> destination, {
    EdgeType edgeType,
    double? weight,
  });

  List<Edge<E>> edges(Vertex<E> source);
  double? weight(Vertex<E> source, Vertex<E> destination);
}

class AdjacencyList<E> implements Graph<E> {
  final Map<Vertex<E>, List<Edge<E>>> _connections = {};
  var _nextIndex = 0;

  @override
  Iterable<Vertex<E>> get vertices => _connections.keys;

  @override
  Vertex<E> createVertex(E data) {
    final vertex = Vertex(data: data, index: _nextIndex);
    _nextIndex++;
    _connections[vertex] = [];
    return vertex;
  }

  @override
  void addEdge(
    Vertex<E> source,
    Vertex<E> destination, {
    EdgeType edgeType = EdgeType.directed,
    double? weight,
  }) {
    _connections[source]?.add(
      Edge(source: source, destination: destination, weight: weight),
    );

    if (edgeType == EdgeType.undirected) {
      _connections[source]?.add(
        Edge(source: destination, destination: source, weight: weight),
      );
    }
  }

  @override
  List<Edge<E>> edges(Vertex<E> source) {
    return _connections[source] ?? [];
  }

  @override
  double? weight(Vertex<E> source, Vertex<E> destination) {
    final match = edges(source).where((edge) {
      return edge.destination == destination;
    });

    if (match.isEmpty) return null;
    return match.first.weight;
  }

  @override
  String toString() {
    final result = StringBuffer();

    _connections.forEach((vertex, edges) {
      final destinatins = edges.map((edge) => edge.destination).join(', ');

      result.writeln('$vertex --> $destinatins');
    });

    return result.toString();
  }
}

void main() {
  final graph = AdjacencyList<String>();
  final singapore = graph.createVertex('Singapore');
  final tokyo = graph.createVertex('Tokyo');
  final hongKong = graph.createVertex('Hong Kong');
  final detroit = graph.createVertex('Detroit');
  final sanFrancisco = graph.createVertex('San Francisco');
  final washingtonDC = graph.createVertex('Washington DC');
  final austinTexas = graph.createVertex('Austin Texas');
  final seattle = graph.createVertex('Seattle');
  graph.addEdge(singapore, hongKong, weight: 300);
  graph.addEdge(singapore, tokyo, weight: 500);
  graph.addEdge(hongKong, tokyo, weight: 250);
  graph.addEdge(tokyo, detroit, weight: 450);
  graph.addEdge(tokyo, washingtonDC, weight: 300);
  graph.addEdge(hongKong, sanFrancisco, weight: 600);
  graph.addEdge(detroit, austinTexas, weight: 50);
  graph.addEdge(austinTexas, washingtonDC, weight: 292);
  graph.addEdge(sanFrancisco, washingtonDC, weight: 337);
  graph.addEdge(washingtonDC, seattle, weight: 277);
  graph.addEdge(sanFrancisco, seattle, weight: 218);
  graph.addEdge(austinTexas, sanFrancisco, weight: 297);
  print(graph);
}
