

from python_algos.binary_search_tree.node import Node


class BST(object):
    """
    A class representing a Binary Search Tree (BST).
    
    Attributes:
        root: The root node of the BST.
    """

    def __init__(self):
        """
        Initializes an empty Binary Search Tree.
        """
        self.root = None

    def insert(self, data):
        """
        Inserts a new node with the given data into the BST.
        
        Args:
            data: The data to be inserted.
        """
        if self.root is None:
            self.root = Node(data)
        else:
            self.root.insert(data)

    def remove(self, dataToRemove):
        """
        Removes a node with the given data from the BST.
        
        Args:
            data: The data of the node to be removed.
        """
        if self.root is not None:
            if self.root.data == dataToRemove:
                tempNode = Node(0)
                tempNode.left = self.root
                self.root.remove(dataToRemove, tempNode)
                self.root = tempNode.left
            else:
                self.root.remove(dataToRemove, None)
        else:
            print(f"Node with data {dataToRemove} not found.")

    def getMax(self):
        """
        Returns the maximum value in the BST.
        
        Returns:
            The maximum value in the BST.
        """
        if self.root is not None:
            return self.root.getMax()
        else:
            return None
        
    def getMin(self):
        """
        Returns the minimum value in the
        BST.

        Returns:
            The minimum value in the BST.
        """
        if self.root is not None:
            return self.root.getMin()
        else:
            return None
        
    def traverse(self):
        """
        Traverses the BST in-order and prints the values.
        """
        if self.root is not None:
            self.root.traverseInOrder()
        else:
            print("The BST is empty.")
       