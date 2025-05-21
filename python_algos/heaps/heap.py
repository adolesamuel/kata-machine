class Heap(object):
    HEAP_SIZE = 10
    def __init__(self):
        self.heap = [0] * self.HEAP_SIZE
        self.currentPosition = -1

    def insert(self, item):
        if self.isFull():
            print("Heap is full")
            return
        self.currentPosition += 1
        self.heap[self.currentPosition] = item
        self.fixUp(self.currentPosition)

    def isFull(self):
        return self.currentPosition == self.HEAP_SIZE - 1
    
    def fixUp(self, index):
        while index > 0:
            parentIndex = (index - 1) // 2
            if self.heap[index] < self.heap[parentIndex]:
                self.swap(index, parentIndex)
                index = parentIndex
            else:
                break
    
    def swap(self, index1, index2):
        temp = self.heap[index1]
        self.heap[index1] = self.heap[index2]
        self.heap[index2] = temp

    def getMax(self):
        if self.isEmpty():
            print("Heap is empty")
            return
        maxItem = self.heap[0]
        self.currentPosition -= 1
        self.heap[0] = self.heap[self.currentPosition + 1]
        self.fixDown(0,-1)
        return maxItem
    
    def fixDown(self, index, lastIndex):
        if lastIndex < 0:
            lastIndex = self.currentPosition
        while index <= lastIndex:
            leftChild = 2 * index + 1
            rightChild = 2 * index + 2
            if leftChild > lastIndex:
                break
            if rightChild > lastIndex:
                if self.heap[index] > self.heap[leftChild]:
                    self.swap(index, leftChild)
                    index = leftChild
                else:
                    break
            else:
                if self.heap[index] > self.heap[leftChild] or self.heap[index] > self.heap[rightChild]:
                    if self.heap[leftChild] < self.heap[rightChild]:
                        self.swap(index, leftChild)
                        index = leftChild
                    else:
                        self.swap(index, rightChild)
                        index = rightChild
                else:
                    break

    # Perform heap sort
    def heapSort(self):
        sortedList = []
        for i in range(0,self.currentPosition+1):
            temp = self.heap[0]
            sortedList.append(temp)
            self.heap[0] = self.heap[self.currentPosition-i]
            self.heap[self.currentPosition-i] = temp
            self.fixDown(0, self.currentPosition - i - 1)
       # Or
       # sortedList = []
       # sortedList.append(self.getMax())
       # return sortedList
