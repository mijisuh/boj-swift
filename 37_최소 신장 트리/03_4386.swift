import Foundation

typealias Node = (x: Float, y: Float)
typealias Edge = (u: Int, v: Int, w: Float)

func getDistance(_ u: Node, _ v: Node) -> Float {
    return sqrt(pow(u.x - v.x, 2) + pow(u.y - v.y, 2))
}

func find(_ u: Int) -> Int {
    if parent[u] == u { return u }
    parent[u] = find(parent[u])
    return parent[u]
}

func merge(_ u: Int, _ v: Int) {
    let parentU = find(u)
    let parentV = find(v)

    if parentU < parentV {
        parent[parentV] = parentU
    } else if parentV < parentU {
        parent[parentU] = parentV
    }
}

func isCycle(_ u: Int, _ v: Int) -> Bool {
    return find(u) == find(v)
}

func kruskal() -> Float {
    var minWeight: Float = 0.0
    
    edges.sort { $0.w < $1.w }
    for (u, v, w) in edges where !isCycle(u, v) {
        merge(u, v)
        minWeight += w
    }
    
    return minWeight
}

let n = Int(readLine() ?? "") ?? 0

var nodes: [Node] = []
for _ in 0..<n {
    let xy = (readLine() ?? "").split { $0 == " " }.map { Float($0) ?? 0.0 }
    let (x, y) = (xy[0], xy[1])
    nodes.append((x, y))
}

var edges: [Edge] = []
for i in 0..<n {
    for j in (i + 1)..<n {
        let w = getDistance(nodes[i], nodes[j])
        edges.append((i, j, w))
    }
}

var parent = [Int](0...n)

print(String(format: "%.2f", kruskal()))
