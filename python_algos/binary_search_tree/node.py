class Node(object):
    """
    A class representing a node in a binary search tree (BST).
    
    Attributes:
        data: The value stored in the node.
        left: A reference to the left child node. less than the current node's data.
        right: A reference to the right child node. greater than the current node's data.
    """

    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

    def __repr__(self):
        return f"Node({self.data})"
    

    def insert(self, data):
        """
        Inserts a new node with the given data into the BST.
        
        Args:
            data: The value to be inserted into the BST.
        """
        if data < self.data:
            if self.left is None:
                self.left = Node(data)
            else:
                self.left.insert(data)
        elif data > self.data:
            if self.right is None:
                self.right = Node(data)
            else:
                self.right.insert(data)

    def remove(self,data,parentNode):
        
        if data < self.data:
            if self.left is not None:
                self.left.remove(data,self)
        elif data > self.data:
            if self.right is not None:
                self.right.remove(data,self)
        else:
            if self.left is not None and self.right is not None:
                self.data = self.right.getMin()
                self.right.remove(self.data,self)
            elif parentNode.left == self:
                if self.left is not None:
                    tempNode = self.left
                else:
                    tempNode = self.right
                parentNode.left = tempNode
            elif parentNode.right == self:
                if self.left is not None:
                    tempNode = self.left
                else:
                    tempNode = self.right
                parentNode.right = tempNode

        
        
    
    def getMin(self):
        """
        Returns the node with the minimum value in the BST.
        
        Returns:
            The node with the minimum value.
        """
        if self.left is None:
            return self.data
        return self.left.getMin()

    def getMax(self):
        """
        Returns the node with the maximum value in the BST.
        
        Returns:
            The node with the maximum value.
        """
        if self.right is None:
                return self.data
        return self.right.getMax()
    
    def traverseInOrder(self):
        if self.left is not None:
            self.left.traverseInOrder()
        
        print(self.data)

        if self.right is not None:
            self.right.traverseInOrder()