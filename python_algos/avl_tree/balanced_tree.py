
from python_algos.avl_tree.node import Node


class BalancedTree(object):
    def __init__(self):
        self.rootNode = None

    def insert(self,data):
        parentNode = self.rootNode

        if self.rootNode == None:
            parentNode = Node(data,None)
            self.rootNode = parentNode
        else:
            parentNode = self.rootNode.insert(data,self.rootNode)
        self.rebalanceTree(parentNode)


    def rebalanceTree(self,parentNode):
        self.setBalance(parentNode)
        if parentNode.balance < -1:
            if self.height(parentNode.leftChild.leftChild) >= self.height(parentNode.leftChild.rightChild):
                parentNode = self.rotateRight(parentNode)
            else:
                parentNode = self.rotateLeftRight(parentNode)
        elif parentNode.balance > 1:
            if self.height(parentNode.rightChild.rightChild) >= self.height(parentNode.rightChild.leftChild):
                parentNode = self.rotateLeft(parentNode)
            else:
                parentNode = self.rotateRightLeft(parentNode)
        if parentNode.parentNode != None:
            self.rebalanceTree(parentNode.parentNode)
        else:
            self.rootNode = parentNode

    def rotateLeftRight(self,node):
        print("Rotation Left Right....")
        node.leftChild = self.rotateLeft(node.leftChild)
        return self.rotateRight(node)
    
    def rotateRightLeft(self,node):
        print("Rotation Right Left....")
        node.rightChild = self.rotateRight(node.rightChild)
        return self.rotateLeft(node)
    
    def rotateLeft(self,node):
        print("Rotation Left....")
        newParent = node.rightChild
        node.rightChild = newParent.leftChild
        newParent.leftChild = node
        self.setBalance(node)
        self.setBalance(newParent)
        return newParent
    
    def rotateRight(self,node):
        print("Rotation Right....")
        newParent = node.leftChild
        node.leftChild = newParent.rightChild
        newParent.rightChild = node
        self.setBalance(node)
        self.setBalance(newParent)
        return newParent

    
    def setBalance(self, node):
        node.balance = (self.height(node.rightChild) - self.height(node.leftChild))
    
    def height(self,node):
        if node == None:
            return -1
        else:
            return 1 + max(self.height(node.leftChild),self.height(node.rightChild))
        