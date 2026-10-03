package nopriorityqueue

import "fmt"

/// Matrix Based

/// dist[start] = 0

// repeat:

//     current = closest unvisited node

//     mark current as visited

//     for every neighbour:

//         newDistance = dist[current] + edgeWeight

//         if newDistance < dist[neighbour]:
//             dist[neighbour] = newDistance

const INF = int(1e9)

func dijkstra(graph [][]int, start int) []int {
	n := len(graph)

	// Shortest known distance to every node.
	dist := make([]int, n)

	// Prev, used to track back the route
	prev := make([]int, n)

	// Whether we've already finalised the shortest distance.
	visited := make([]bool, n)

	// Initially, every nod is unreachable.

	for i := range dist {
		dist[i] = INF
		prev[i] = -1
	}

	// distance from start to itself is 0.
	dist[start] = 0

	for i := 0; i < n; i++ {
		// find the unvisited node with the smallst distance.
		current := -1

		for j := 0; j < n; j++ {
			if !visited[j] && (current == -1 || dist[j] < dist[current]) {
				current = j
			}
		}

		// No more reachable nodes.
		if current == -1 || dist[current] == INF {
			break
		}
		// We now know the shortest distance to current.
		visited[current] = true

		// Check all neighbours of current.
		for neighbour := 0; neighbour < n; neighbour++ {

			// No edge between current and neighbour.
			if graph[current][neighbour] == 0 {
				continue
			}

			newDistance := dist[current] + graph[current][neighbour]

			// Found a shorter path?
			if newDistance < dist[neighbour] {
				dist[neighbour] = newDistance
				prev[neighbour] = current

			}
		}
	}

	return dist

}

func main() {
	graph := [][]int{
		//   0  1  2  3  4
		{0, 4, 2, 0, 0}, // 0
		{0, 0, 0, 1, 0}, // 1
		{0, 1, 0, 3, 0}, // 2
		{0, 0, 0, 0, 2}, // 3
		{0, 0, 0, 0, 0}, // 4
	}

	distances := dijkstra(graph, 0)

	fmt.Println(distances)
}
