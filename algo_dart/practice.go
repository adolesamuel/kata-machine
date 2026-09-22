package main

// TreeNode Struct
type TreeNode[E any] struct {
	Value    E
	Children []TreeNode[E]
}

// Add
func (t *TreeNode[E]) Add(child TreeNode[E]) {
	t.Children = append(t.Children, child)
}

//DFS

func (t *TreeNode[E]) dfs(performAction func(node *TreeNode[E])) {
	performAction(t)
	for _, val := range t.Children {
		val.dfs(performAction)
	}
}

//BFS

func (t *TreeNode[E]) bfs(performAction func(node *TreeNode[E])) {
	for _, val := range t.Children {
		val.bfs(performAction)
	}
	performAction(t)
}
