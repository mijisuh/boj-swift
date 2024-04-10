typealias Edge = (u: Int, v: Int, w: Int)

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
    } else {
        return
    }
}

func isCycle(_ u: Int, _ v: Int) -> Bool {
    return find(u) == find(v)
}

func kruskal() -> Int {
    var answer = 0

    edges.sort { $0.w < $1.w }

    for (u, v, w) in edges {
        if !isCycle(u, v) {
            merge(u, v)
            answer += w
        }
    }

    return answer
}

let ve = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (v, e) = (ve[0], ve[1])

var edges: [Edge] = []
var parent = [Int](0...v)

for _ in 0..<e {
    let uvw = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
    let (u, v, w) = (uvw[0], uvw[1], uvw[2])
    edges.append((u, v, w))
}

print(kruskal())
