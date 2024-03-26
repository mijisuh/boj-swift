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
    var cost: Int

    init(_ node: Int, _ cost: Int) {
        self.node = node
        self.cost = cost
    }
    
    static func < (lhs: Data, rhs: Data) -> Bool {
        return lhs.cost < rhs.cost
    }
}

func dijkstra(start: Int) -> [Int] {
    // 최소비용 테이블
    var minCosts = [Int](repeating: INF, count: v + 1)

    // 우선순위 큐 구현
    var heap = MinHeap<Data>(compare: <)

    // 최소비용 테이블, 우선순위 큐 초기화
    minCosts[start] = 0
    heap.insert(Data(start, 0))

    while !heap.isEmpty {
        let current = heap.pop()!

        // 이미 갱신된 노드라면 아무 것도 하지 않음
        if current.cost > minCosts[current.node] { continue }

        // 현재 노드의 인접 노드 확인
        for next in graph[current.node] {
            // 현재 노드를 거쳐서 다음 노드로 가는 비용
            let cost = current.cost + next.cost

            // 현재 노드를 거쳐서 다음 노드로 가는 비용이 더 작다면
            if cost < minCosts[next.node] {
                minCosts[next.node] = cost // 비용 갱신
                heap.insert(Data(next.node, cost)) // 우선순위 큐에 삽입
            }
        }
    }

    return minCosts
}

let ve = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (v, e) = (ve[0], ve[1])
var graph = [[Data]](repeating: [], count: v + 1)
for _ in 0..<e {
    let uvw = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
    graph[uvw[0]].append(Data(uvw[1], uvw[2]))
    graph[uvw[1]].append(Data(uvw[0], uvw[2]))
}
let targets = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (v1, v2) = (targets[0], targets[1])

let INF = 200_000_001 // Int.max로 하면 오버플로우 발생 가능

let minCostsFromStart = dijkstra(start: 1)
let minCostsFromV1 = dijkstra(start: v1)
let minCostsFromV2 = dijkstra(start: v2)

// 1 -> v1 -> v2 -> V
let firstCase = minCostsFromStart[v1] + minCostsFromV1[v2] + minCostsFromV2[v]
// 1 -> v2 -> v2 -> V
let secondCase = minCostsFromStart[v2] + minCostsFromV2[v1] + minCostsFromV1[v]

let answer = min(firstCase, secondCase)
print(answer < INF ? answer : -1) // 중간에 INF 값이 있을 수도 있음(경로가 없는 경우)
