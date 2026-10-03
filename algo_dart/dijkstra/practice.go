package practice

import "math"

const INF = math.MaxInt32

/// Declared underlying DS.
// 4.

// Dijkstra
func Dijkstra(graph [][]int, source int) []int {
	n := len(graph)
	distanceTable := make([]int, n)
	visitedTable := make([]bool, n)
	prevTable := make([]int, n)

	for i := range distanceTable {
		distanceTable[i] = INF
		prevTable[i] = -1
	}

	distanceTable[source] = 0

	for range n {
		current := -1

		for k := range n {
			if !visitedTable[k] && (current == -1 || distanceTable[k] < distanceTable[current]) {
				current = k
			}
		}

		if current == -1 || distanceTable[current] == INF {
			break
		}

		visitedTable[current] = true

		for i := range n {
			if graph[current][i] == 0 {
				continue
			}

			newDistance := distanceTable[current] + graph[current][i]
			if newDistance < distanceTable[i] {
				distanceTable[i] = newDistance
				prevTable[i] = current
			}
		}

	}

	return distanceTable
}
