class Node(object):
    def __init__(self, data):
        self.data = data
        self.next = None

    def __repr__(self):
        return f"Node({self.data})"
    
    def remove(self,data,previousNode):
        if self.data == data:
            previousNode.next = self.next
            del self.data
            del self.nextNode
        else:
            if self.next is not None:
                self.next.remove(data,self)
            else:
                print(f"Node with data {data} not found.")