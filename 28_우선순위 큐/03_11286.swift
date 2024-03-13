// 방법 1) MinHeap + Tuple
struct MinHeap {
    private var array: [(abs: Int, original: Int)] = [(0, 0)]
    
    mutating func insert(_ input: (Int, Int)) {
        array.append(input)
        var index = array.count - 1
        while let parentIndex = moveUp(index) {
            array.swapAt(index, parentIndex)
            index = parentIndex
        }
    }

    mutating func pop() -> Int {
        switch array.count {
            case 1: return 0
            case 2: return array.removeLast().original
            default:
                var index = 1
                let returnValue = array[index].original
    
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
        if array[index].abs == array[parentIndex].abs { // 입력 값의 절댓값이 부모 노드와 같을 경우
            return array[index].original > array[parentIndex].original ? nil : parentIndex // 원래 값을 비교(부모 노드보다 작아야 올라감)
        }
        return array[index].abs > array[parentIndex].abs ? nil : parentIndex
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
    
        let lessChildIndex = array[leftChildIndex] > array[rightChildIndex]
        ? rightChildIndex
        : leftChildIndex
    
        return array[index] > array[lessChildIndex] ? lessChildIndex : nil
    }
}

_ = Int(readLine() ?? "") ?? 0
var heap = MinHeap()
while let input = Int(readLine() ?? "") {
    if input == 0 {
        print(heap.pop())
    } else {
        heap.insert((abs(input), input))
    }
}

// 방법 2) Comparable 프로토콜
struct MinHeap<T: Comparable> {
    private var array: [T?] = [nil]
    private let compare: (T, T) -> Bool

    init(compare: @escaping (T, T) -> Bool) {
        self.compare = compare
    }
    
    mutating func insert(_ input: T) {
        array.append(input)
        var index = array.count - 1
        while let parentIndex = moveUp(index) {
            array.swapAt(index, parentIndex)
            index = parentIndex
        }
    }

    mutating func pop() -> T? {
        switch array.count {
            case 1: return nil
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
        return compare(array[index]!, array[parentIndex]!) ? parentIndex : nil
    }

    private func moveDown(_ index: Int) -> Int? {
        let leftChildIndex = index * 2
        let rightChildIndex = index * 2 + 1

        guard leftChildIndex < array.count else {
            return nil
        }
    
        guard rightChildIndex < array.count else {
            return compare(array[index]!, array[leftChildIndex]!) ? nil : leftChildIndex
        }
    
        let lessChildIndex = compare(array[rightChildIndex]!, array[leftChildIndex]!)
        ? rightChildIndex
        : leftChildIndex
    
        return compare(array[lessChildIndex]!, array[index]!) ? lessChildIndex : nil
    }
}

struct Data: Comparable { // 커스텀 비교 연산 정의
    var absValue: Int
    var value: Int
    static func < (lhs: Data, rhs: Data) -> Bool {
        return lhs.absValue == rhs.absValue ? lhs.value < rhs.value : lhs.absValue < rhs.absValue
    }
}

_ = Int(readLine() ?? "") ?? 0
var heap = MinHeap<Data>(compare: <)
while let input = Int(readLine() ?? "") {
    if input == 0 {
        print(heap.pop()?.value ?? 0)
    } else {
        heap.insert(Data(absValue: abs(input), value: input))
    }
}
