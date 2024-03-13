struct MaxHeap {
    private var array: [Int] = [0]
    
    mutating func insert(_ n: Int) {
        array.append(n)
        var index = array.count - 1
        while let parentIndex = moveUp(index) { // 부모 노드가 있을 때까지 올라감
            array.swapAt(index, parentIndex)
            index = parentIndex
        }
    }

    mutating func pop() -> Int {
        switch array.count {
            case 1: return 0 // 힙이 비어있는 경우
            case 2: return array.removeLast() // 힙에 1개의 요소가 있는 경우
            default:
                var index = 1
                let returnValue = array[index]
    
                array[index] = array.removeLast()
                
                while let childIndex = moveDown(index) { // 자식 노드가 있을 때까지 내려감
                    array.swapAt(index, childIndex)
                    index = childIndex
                }
            
                return returnValue
        }
    }

    private func moveUp(_ index: Int) -> Int? {
        if index <= 1 { return nil }
        let parentIndex = index / 2
        return array[index] < array[parentIndex] ? nil : parentIndex
    }

    private func moveDown(_ index: Int) -> Int? {
        let leftChildIndex = index * 2
        let rightChildIndex = index * 2 + 1

                // CASE 1: 자식 노드가 존재하지 않는 경우
        guard leftChildIndex < array.count else {
            return nil
        }
    
                // CASE 2: 왼쪽 자식 노드만 존재하는 경우
        guard rightChildIndex < array.count else {
            return array[index] < array[leftChildIndex] ? leftChildIndex : nil
        }
    
                // CASE 3: 양쪽 자식 노드가 모두 존재하는 경우
        let largerChildIndex: Int
        if array[leftChildIndex] < array[rightChildIndex] {
            largerChildIndex = rightChildIndex
        } else {
            largerChildIndex = leftChildIndex
        }
    
        return array[index] < array[largerChildIndex] ? largerChildIndex : nil
    }
}

_ = Int(readLine() ?? "") ?? 0
var heap = MaxHeap()
while let input = Int(readLine() ?? "") {
    if input == 0 {
        print(heap.pop())
    } else {
        heap.insert(input)
    }
}
