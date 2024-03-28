struct MinHeap<T> {
    private var elements: [T?] = [nil]
    private var compare: (T, T) -> Bool

    init(compare: @escaping (T, T) -> Bool) {
        self.compare = compare
    }

    var isEmpty: Bool {
        return elements.count <= 1
    }

    mutating func insert(_ element: T) {
        elements.append(element)
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
    
    mutating func moveUp(_ index: Int) -> Int? {
        if index <= 1 { return nil }

        let parentIndex = index / 2
        return compare(elements[index]!, elements[parentIndex]!) ? parentIndex : nil
    }

    mutating func moveDown(_ index: Int) -> Int? {
        let leftChildIndex = index * 2
        let rightChildIndex = index * 2 + 1

        guard leftChildIndex < elements.count else { return nil }
        
        guard rightChildIndex < elements.count else {
            return compare(elements[leftChildIndex]!, elements[index]!) ? leftChildIndex : nil
        }

        let lessChildIndex = compare(elements[leftChildIndex]!, elements[rightChildIndex]!)
        ? leftChildIndex
        : rightChildIndex

        return compare(elements[lessChildIndex]!, elements[index]!) ? lessChildIndex : nil
    }
}

struct Data: Comparable {
    var node: Int
    var distance: Int

    init(_ node: Int, _ distance: Int) {
        self.node = node
        self.distance = distance
    }

    static func <(lhs: Data, rhs: Data) -> Bool {
        return lhs.distance < rhs.distance
    }
}

func dijstra(_ start: Int, _ n: Int, _ graph: [[Data]]) -> [Int] {
    var minDistances = [Int](repeating: INF, count: n + 1)
    var minHeap = MinHeap<Data>(compare: <)

    minDistances[start] = 0
    minHeap.insert(Data(start, 0))

    while !minHeap.isEmpty {
        let current = minHeap.pop()!

        if current.distance > minDistances[current.node] { continue }

        for next in graph[current.node] {
            let total = current.distance + next.distance

            if total < minDistances[next.node] {
                minDistances[next.node] = total
                minHeap.insert(Data(next.node, total))
            }
        }
    }

    return minDistances
}

let INF = 50_000_001

let T = Int(readLine() ?? "") ?? 0
for _ in 0..<T {
    let nmt = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
    let (n, m, t) = (nmt[0], nmt[1], nmt[2])

    let sgh = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
    let (s, g, h) = (sgh[0], sgh[1], sgh[2])

    var graph = [[Data]](repeating: [], count: n + 1)
    for _ in 0..<m {
        let abd = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
        let (a, b, d) = (abd[0], abd[1], abd[2])
        graph[a].append(Data(b, d))
        graph[b].append(Data(a, d))
    }

    var result: [Int] = []
    for _ in 0..<t {
        let x = Int(readLine() ?? "") ?? 0

        // 1. 최단 거리
        let minDistFromS = dijstra(s, n, graph)
        let minDist = minDistFromS[x]
        
        // 2. g, h를 포함한 최단 거리
        let minDistFromG = dijstra(g, n, graph)
        let minDistFromH = dijstra(h, n, graph)
        let minDistWithGH = min(
            minDistFromS[g] + minDistFromG[h] + minDistFromH[x],
            minDistFromS[h] + minDistFromH[g] + minDistFromG[x]
        )

        // 1 == 2면 출력
        if minDist == minDistWithGH {
            result.append(x)
        }
    }
    print(result.sorted().map { String($0) }.joined(separator: " "))
}
