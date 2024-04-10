import Foundation

typealias Point = (x: Double, y: Double)
typealias Edge = (u: Int, v: Int, w: Double)

func getDistance(_ u: Point, _ v: Point) -> Double {
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

func kruskal() {
    var minWeight = 0.0
    
    edges.sort { $0.w < $1.w }
    
    for (u, v, w) in edges where !isCycle(u, v) {
        merge(u, v)
        minWeight += w
    }

    print(String(format: "%.2f", round(minWeight * 100) / 100))
}

let nm = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (n, m) = (nm[0], nm[1])

var points: [Point] = []
for _ in 0..<n {
    let xy = (readLine() ?? "").split { $0 == " " }.map { Double($0) ?? 0.0 }
    let (x, y) = (xy[0], xy[1])
    points.append((x, y))
}

var parent = [Int](0...n)

for _ in 0..<m {
    let uv = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
    let (u, v) = (uv[0], uv[1])
    merge(u, v) // 이미 연결된 간선은 미리 합쳐줌
}

var edges: [Edge] = []
for i in 0..<n {
    for j in (i + 1)..<n {
        let w = getDistance(points[i], points[j])
        edges.append((i + 1, j + 1, w))
    }
}

kruskal()
