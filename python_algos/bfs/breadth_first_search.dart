import '../graphs/graph.dart';

extension BreadthFirstSearch<E> on Graph<E> {
  List<Vertex<E>> breadFirstSearch(Vertex<E> source) {
    final queue = QueueStack<Vertex<E>>();
    Set<Vertex<E>> enqueued = {};
    List<Vertex<E>> visited = [];

    queue.enqueue(source);

    return visited;
  }
}
