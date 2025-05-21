
public class Vertex{
    private int data;
    private boolean visited;
    private List<Vertex> neighbourList;

    public Vertex(int data){
        this.data = data;
        this.visited = false;
        this.neighbourList = new ArrayList<>();
    }

    public void addNeighbour(Vertex vertex){
        this.neighbourList.add(vertex);
    }

    public int getData(){
        return this.data;
    }

    public int setData(int data){
        this.data = data;
    }

    public boolean isVisited(){
        return this.visited;
    }
    public void setVisited(boolean visited){
        this.visited = visited;
    }
    public List<Vertex> getNeighbourList(){
        return this.neighbourList;
    }
}