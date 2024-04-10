// 방법 1) 최소 신장 트리의 특성 이용
// 모든 노드를 연결해야 하고, 가중치가 모두 동일하므로 (모든 노드의 개수 - 1)
let testCase = Int(readLine() ?? "") ?? 0
for _ in 0..<testCase {
    let nm = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
    let (n, m) = (nm[0], nm[1])

    for _ in 0..<m { _ = readLine() }

    print(n - 1)
}

// 방법 2) 크루스칼 알고리즘
typealias Edge = (u: Int, v: Int, w: Int)

func find(_ u: Int, _ parent: inout [Int]) -> Int {
    if parent[u] == u { return u }
    parent[u] = find(parent[u], &parent)
    return parent[u]
}

func merge(_ u: Int, _ v: Int, _ parent: inout [Int]) {
    let parentU = find(u, &parent)
    let parentV = find(v, &parent)

    if parentU == parentV { return }
    
    if parentU > parentV {
        parent[parentU] = parentV
    } else {
        parent[parentV] = parentU
    }
}

func isCycle(_ u: Int, _ v: Int, _ parent: inout [Int]) -> Bool {
    let parentU = find(u, &parent)
    let parentV = find(v, &parent)
    return parentU == parentV
}

func kruskal(_ edges: inout [Edge], _ parent: inout [Int]) -> Int {
    var answer = 0

    edges.sort { $0.w < $1.w } // 간선 배열을 가중치의 오름차순으로 정렬
    
    for edge in edges { // 가중치가 작은 순서대로
        if !isCycle(edge.u, edge.v, &parent) { // 사이클이 없다면
            merge(edge.u, edge.v, &parent) // 합침
            answer += 1
        }
    }

    return answer
}

let testCase = Int(readLine() ?? "") ?? 0
for _ in 0..<testCase {
    let nm = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
    let (n, m) = (nm[0], nm[1])

    var edges: [Edge] = []
    var parent = [Int](0...n)
    
    for _ in 0..<m {
        let uv = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
        let (u, v) = (uv[0], uv[1])
        edges.append((u, v, 1))
    }

    print(kruskal(&edges, &parent))
}
