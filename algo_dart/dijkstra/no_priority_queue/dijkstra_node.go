package nopriorityqueue

import (
	"math"
)

// Edge represents a weighted connection to a neighboring node
type Edge struct {
	To     int
	Weight int
}

// Graph represents a directed or undirected graph using an adjacency list
type Graph struct {
	Vertices int
	AdjList  [][]Edge
}

// NewGraph initializes a graph with V vertices
func NewGraph(vertices int) *Graph {
	return &Graph{
		Vertices: vertices,
		AdjList:  make([][]Edge, vertices),
	}
}

// AddEdge adds a directed edge from 'from' to 'to' with a given weight
func (g *Graph) AddEdge(from, to, weight int) {
	g.AdjList[from] = append(g.AdjList[from], Edge{To: to, Weight: weight})
}

// Dijkstra finds the shortest paths from a source node to all other nodes without a priority queue
func Dijkstra(g *Graph, source int) ([]int, []int) {
	v := g.Vertices

	// dist[i] holds the shortest distance from source to node i
	dist := make([]int, v)
	// visited[i] tracks whether node i has been finalized
	visited := make([]bool, v)
	// prev[i] stores the predecessor node to reconstruct the path
	prev := make([]int, v)

	// Step 1: Initialize all distances to infinity, and predecessors to -1
	for i := 0; i < v; i++ {
		dist[i] = math.MaxInt32
		prev[i] = -1
	}
	// Distance from the source to itself is always 0
	dist[source] = 0

	// Step 2: Iterate through all vertices
	for count := 0; count < v; count++ {
		// Linear Scan: Find the unvisited node with the absolute minimum distance
		u := -1
		minDist := math.MaxInt32

		for i := 0; i < v; i++ {
			if !visited[i] && dist[i] < minDist {
				minDist = dist[i]
				u = i
			}
		}

		// If the minimum distance is still infinity, remaining nodes are unreachable
		if u == -1 {
			break
		}

		// Mark the chosen vertex as visited (finalized)
		visited[u] = true

		// Step 3: Update the distance of neighboring vertices
		for _, edge := range g.AdjList[u] {
			alt := dist[u] + edge.Weight
			// Relax the edge if a shorter path is found
			if alt < dist[edge.To] {
				dist[edge.To] = alt
				prev[edge.To] = u
			}
		}
	}

	return dist, prev
}
