package trees

type TreeNode[E any] struct {
	Value    E
	Children []TreeNode[E]
}

func (t *TreeNode[E]) Add(child TreeNode[E]) {
	t.Children = append(t.Children, child)
}

// DFS
func (t *TreeNode[E]) ForEachDepthFirst(performAction func(node *TreeNode[E])) {
	performAction(t)
	for _, val := range t.Children {
		val.ForEachDepthFirst(performAction)
	}
}

// BFS
func (t *TreeNode[E]) ForEachLevelOrder(performAction func(node *TreeNode[E])) {
	queue := []*TreeNode[E]{}
	queue = append(queue, t)
	current := t

	for len(queue) != 0 {
		current = queue[0]
		queue = queue[1:]
		performAction(current)
		for _, val := range current.Children {
			queue = append(queue, &val)
		}

	}

}
