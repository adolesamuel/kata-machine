package practice

import "math"

const INF = math.MaxInt32

/// Declared underlying DS.
// 4.

// Dijkstra
func Dijkstra(graph [][]int, source int) []int {
	n := len(graph)

	distance := make([]int, n)
	prev := make([]int, n)
	visited := make([]bool, n)

	for i := range n {
		distance[i] = INF
		prev[i] = -1
	}

	distance[source] = 0

	for range n {
		current := -1

		for i := range n {
			if !visited[i] && (current == -1 || distance[i] < distance[current]) {
				current = i
			}
		}

		if current == -1 || distance[current] == INF {
			break
		}

		visited[current] = true

		for neighbor := range n {
			if graph[current][neighbor] == 0 {
				continue
			}

			newDistance := distance[current] + graph[current][neighbor]
			if newDistance < distance[neighbor] {
				distance[neighbor] = newDistance
				prev[neighbor] = current
			}
		}
	}

	return distance
}
