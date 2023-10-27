export default class Stack<T> {
    public length: number;
    private tail?: Node<T>;
    private head?: Node<T>;


    

    constructor() {
        this.head = this.tail = undefined;
        this.length = 0;
    }

    push(item: T): void {
        const node = {value: item} as Node<T>;
        
        this.length++;
        if(!this.head){
            this.head = node;
            return;
        }
        node.prev = this.head;
        this.head = node;

}
    pop(): T | undefined {
    this.length = Math.max(0, this.length -1);
    if(!this.head){
        return undefined;
    }
    const head = this.head;

    this.head = head.prev;


    return head.value;


}
    peek(): T | undefined {
    return this.head?.value;
}
}



type Node<T> = {
    value: T,
    prev?: Node<T>,
}