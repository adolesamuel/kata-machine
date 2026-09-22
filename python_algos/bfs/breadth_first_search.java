// BFS Algorithm in Java
import java.util.Queue;
import java.util.LinkedList;

import vertex.Vertex;

public class BreadthFirstSearch {
    private Queue<Vertex> queue;
    private Vertex sourceVertex;

    public BreadthFirstSearch(Vertex source){
        this.sourceVertex = source;
        this.queue = new LinkedList<>();
    }

    public void bfs(){
        sourceVertex.setVisited(true);
        queue.add(sourceVertex);

        while(!queue.isEmpty()){
            Vertex currentVertex = queue.poll();
            System.out.print(currentVertex.getData() + " ");

            for(Vertex vertex : currentVertex.getNeighbourList()){
                if(!vertex.isVisited()){
                    vertex.setVisited(true);
                    queue.add(vertex);
                }
            }
        }
    }
}