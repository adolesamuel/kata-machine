package nopriorityqueue

import (
	practice "kata-machine/algo_dart/dijkstra"
	"reflect"
	"testing"
)

func TestDijkstra(t *testing.T) {
	graph := practice.NewGraph(5)
	graph.AddEdge(0, 1, 4)
	graph.AddEdge(0, 2, 1)
	graph.AddEdge(2, 1, 2)
	graph.AddEdge(1, 3, 1)
	graph.AddEdge(2, 3, 5)
	graph.AddEdge(3, 4, 3)

	distances, predecessors := practice.Dijkstra(graph, 0)

	wantDistances := []int{0, 3, 1, 4, 7}
	wantPredecessors := []int{-1, 2, 0, 1, 3}

	if !reflect.DeepEqual(distances, wantDistances) {
		t.Errorf("Dijkstra() distances = %v, want %v", distances, wantDistances)
	}
	if !reflect.DeepEqual(predecessors, wantPredecessors) {
		t.Errorf("Dijkstra() predecessors = %v, want %v", predecessors, wantPredecessors)
	}
}
