from linked_list_ds.node import Node

class LinkedListNode(object):
    def __init__(self):
        self.head = None
        self.counter = 0
       

    def insertStart(self,data):
        newNode = Node(data)
        self.counter += 1

        if not self.head:
            self.head = newNode
        else:
            newNode.next = self.head
            self.head = newNode
     
    def size(self):
        return self.counter
    
    def insertEnd(self,data):
        newNode = Node(data)
        actualNode = self.head

        if self.head is None:
            self.head = newNode
            self.counter += 1
            return
        
        while actualNode.nextNode is not None:
            actualNode = actualNode.nextNode
        actualNode.nextNode = newNode
        self.counter += 1
    
    def remove(self,data):
        if self.head:
            if self.head.data == data:
                self.head = self.head.nextNode
                self.counter -= 1
            else:
               self.head.remove(data,self.head)

    def traverseList(self):
        actualNode = self.head
        while actualNode is not None:
            print(actualNode.data)
            actualNode = actualNode.nextNode
        print("End of Linked List")
              
          