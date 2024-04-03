struct MinHeap<T> {
    private var elements: [T?] = [nil]
    private let compare: (T, T) -> Bool

    init(compare: @escaping (T, T) -> Bool) {
        self.compare = compare
    }

    var isEmpty: Bool {
        return elements.count <= 1
    }

    mutating func insert(_ input: T) {
        elements.append(input)

        var index = elements.count - 1
        while let parentIndex = moveUp(index) {
            elements.swapAt(index, parentIndex)
            index = parentIndex
        }
    }

    mutating func pop() -> T? {
        if elements.count == 1 {
            return nil
        } else if elements.count == 2 {
            return elements.removeLast()
        } else {
            var index = 1
            let returnValue = elements[index]
            elements[index] = elements.removeLast()

            while let childIndex = moveDown(index) {
                elements.swapAt(index, childIndex)
                index = childIndex
            }

            return returnValue
        }
    }

    private func moveUp(_ index: Int) -> Int? {
        if index <= 1 { return nil }

        let parentIndex = index / 2

        return compare(elements[index]!, elements[parentIndex]!) ? parentIndex : nil
    }

    private func moveDown(_ index: Int) -> Int? {
        let leftChildIndex = index * 2
        let rightChildIndex = index * 2 + 1

        guard leftChildIndex < elements.count else {
            return nil // 자식이 없는 경우
        }

        guard rightChildIndex < elements.count else {
            // 왼쪽 노드만 존재
            return compare(elements[leftChildIndex]!, elements[index]!) ? leftChildIndex : nil
        }

        let lessChildIndex = compare(elements[leftChildIndex]!, elements[rightChildIndex]!)
        ? leftChildIndex
        : rightChildIndex

        return compare(elements[lessChildIndex]!, elements[index]!)
        ? lessChildIndex
        : nil
    }
}

struct Data: Comparable {
    var node: Int
    var cost: Int

    init(_ node: Int, _ cost: Int) {
        self.node = node
        self.cost = cost
    }

    static func < (lhs: Data, rhs: Data) -> Bool {
        return lhs.cost < rhs.cost
    }
}

func dijstra(_ from: Int, _ to: Int) {
    var heap = MinHeap<Data>(compare: <)

    let INF = 10_000_000_000
    var minCosts = [Int](repeating: INF, count: n + 1)
    var routes = [Int](repeating: -1, count: n + 1) // 직전 노드에 대한 정보
    
    heap.insert(Data(from, 0))
    minCosts[from] = 0
    routes[from] = 0
    
    while !heap.isEmpty {
        let current = heap.pop()! // cost가 최소인 값

        if current.node == to { break }

        if minCosts[current.node] < current.cost { continue }

        for next in graph[current.node] {
            let cost = current.cost + next.cost

            if cost < minCosts[next.node] {
                minCosts[next.node] = cost
                heap.insert(Data(next.node, cost))
                routes[next.node] = current.node // 직전 노드 저장
            }
        }
    }

    var answer: [Int] = []
    var route = to
    
    while routes[route] != -1 {
        answer.append(route)
        route = routes[route] // 뒤에서부터 직전 노드에 대한 정보를 가져옴
    }

    print(minCosts[to])
    print(answer.count)
    print(answer.reversed().map { String($0) }.joined(separator: " "))
}

let n = Int(readLine() ?? "") ?? 0
let m = Int(readLine() ?? "") ?? 0

var graph = [[Data]](repeating: [], count: n + 1)

for _ in 0..<m {
    let uvw = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
    let (u, v, w) = (uvw[0], uvw[1], uvw[2])

    graph[u].append(Data(v, w))
}

let input = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (from, to) = (input[0], input[1])

dijstra(from, to)
