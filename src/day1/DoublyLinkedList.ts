export default class DoublyLinkedList<T> {
    public length: number;
    private head?: Node<T>;
    private tail?:Node<T>;

    

    constructor() {
    }

    prepend(item: T): void {

}
    insertAt(item: T, idx: number): void {

}
    append(item: T): void {

}
    remove(item: T): T | undefined {

}
    get(idx: number): T | undefined {

}
    removeAt(idx: number): T | undefined {

}
}


type Node<T> = {
    value: T,
    prev?: Node<T>,
    next?: Node<T>,
}