// 방법 1) 다익스트라 알고리즘
struct MinHeap<T> {
    private var array: [T?] = [nil]
    private let compare: (T, T) -> Bool

    init(compare: @escaping (T, T) -> Bool) {
        self.compare = compare
    }

    var isEmpty: Bool {
        return array.count <= 1
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

struct Data: Comparable {
    var node: Int
    var time: Int

    init(_ node: Int, _ time: Int) {
        self.node = node
        self.time = time
    }
    
    static func < (lhs: Data, rhs: Data) -> Bool {
        return lhs.time < rhs.time
    }
}

func isVaildCoord(_ x: Int) -> Bool {
    return 0..<100_001 ~= x
}

func dijkstra(start: Int) -> [Int] {
    let INF = Int.max
    var minTimes = [Int](repeating: INF, count: 100_001)
    var heap = MinHeap<Data>(compare: <)

    minTimes[start] = 0
    heap.insert(Data(start, 0))

    while !heap.isEmpty {
        let current = heap.pop()!

        if current.time > minTimes[current.node] { continue }

        for dx in [-1, 1, current.node] {
            let next = current.node + dx

            if !isVaildCoord(next) { continue }

            var time = current.time
            if dx != current.node { time += 1 }
            if time < minTimes[next] {
                minTimes[next] = time
                heap.insert(Data(next, time))
            }
        }
    }

    return minTimes
}

let nk = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (n, k) = (nk[0], nk[1])

let minTimes = dijkstra(start: n)
print(minTimes[k])
