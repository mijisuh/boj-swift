struct MinHeap {
    private var array: [Int] = [0]
    
    mutating func insert(_ n: Int) {
        array.append(n)
        var index = array.count - 1
        while let parentIndex = moveUp(index) {
            array.swapAt(index, parentIndex)
            index = parentIndex
        }
    }

    mutating func pop() -> Int {
        switch array.count {
            case 1: return 0
            case 2: return array.removeLast()
            default:
                var index = 1
                let returnValue = array[index]
    
                array[index] = array.removeLast()
                
                while let childIndex = moveDown(index) {
                    array.swapAt(index, childIndex)
                    index = childIndex
                }
            
                return returnValue
        }
    }

    private func moveUp(_ index: Int) -> Int? {
        if index <= 1 { return nil }
        let parentIndex = index / 2
        return array[index] > array[parentIndex] ? nil : parentIndex
    }

    private func moveDown(_ index: Int) -> Int? {
        let leftChildIndex = index * 2
        let rightChildIndex = index * 2 + 1

        guard leftChildIndex < array.count else {
            return nil
        }
    
        guard rightChildIndex < array.count else {
            return array[index] > array[leftChildIndex] ? leftChildIndex : nil
        }
    
        let lessChildIndex: Int
    
        if array[leftChildIndex] > array[rightChildIndex] {
            lessChildIndex = rightChildIndex
        } else {
            lessChildIndex = leftChildIndex
        }
    
        return array[index] > array[lessChildIndex] ? lessChildIndex : nil
    }
}

_ = Int(readLine() ?? "") ?? 0
var heap = MinHeap()
while let input = Int(readLine() ?? "") {
    if input == 0 {
        print(heap.pop())
    } else {
        heap.insert(input)
    }
}
