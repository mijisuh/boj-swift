let NMR = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (N, M, R) = (NMR[0], NMR[1], NMR[2])
var edges: [Int: [Int]] = [:]
for _ in 0..<M {
    let UV = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
    let (U, V) = (UV[0], UV[1])
    edges[U, default: []].append(V)
    edges[V, default: []].append(U) // 양방향
}

var visited = [Int](repeating: 0, count: N + 1) // 해당 인덱스(정점)에 방문하는 순서 저장

var depth = 1
func dfs(_ node: Int) {
    visited[node] = depth
    for next in edges[node, default: []].sorted(by: >) {
        if visited[next] == 0 {
            depth += 1
            dfs(next)
        }
    }
}

dfs(R)
print(visited[1...].map { String($0) }.joined(separator: "\n"))
