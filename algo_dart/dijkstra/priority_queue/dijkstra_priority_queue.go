package priorityqueue

import (
	"container/heap"
	"fmt"
)

type Edge struct {
	to     int
	weight int
}

type Item struct {
	node     int
	distance int
}

type PriorityQueue []Item

func (pq PriorityQueue) Len() int {
	return len(pq)
}

func (pq PriorityQueue) Less(i, j int) bool {
	return pq[i].distance < pq[j].distance
}

func (pq PriorityQueue) Swap(i, j int) {
	pq[i], pq[j] = pq[j], pq[i]
}

func (pq *PriorityQueue) Push(x interface{}) {
	*pq = append(*pq, x.(Item))
}

func (pq *PriorityQueue) Pop() interface{} {
	old := *pq
	n := len(old)

	item := old[n-1]
	*pq = old[:n-1]

	return item
}

func dijkstra(graph [][]Edge, start int) []int {
	n := len(graph)

	const INF = int(^uint(0) >> 1)

	dist := make([]int, n)

	for i := range dist {
		dist[i] = INF
	}

	dist[start] = 0

	pq := &PriorityQueue{
		{
			node:     start,
			distance: 0,
		},
	}

	heap.Init(pq)

	for pq.Len() > 0 {
		current := heap.Pop(pq).(Item)

		node := current.node
		distance := current.distance

		// Ignore stale entries.
		if distance > dist[node] {
			continue
		}

		for _, edge := range graph[node] {
			newDistance := distance + edge.weight

			if newDistance < dist[edge.to] {
				dist[edge.to] = newDistance

				heap.Push(pq, Item{
					node:     edge.to,
					distance: newDistance,
				})
			}
		}
	}

	return dist
}

func main() {
	graph := make([][]Edge, 5)

	graph[0] = []Edge{
		{to: 1, weight: 4},
		{to: 2, weight: 2},
	}

	graph[1] = []Edge{
		{to: 3, weight: 1},
	}

	graph[2] = []Edge{
		{to: 1, weight: 1},
		{to: 3, weight: 3},
	}

	graph[3] = []Edge{
		{to: 4, weight: 2},
	}

	distances := dijkstra(graph, 0)

	fmt.Println(distances)
}
