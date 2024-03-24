let N = Int(readLine() ?? "") ?? 0
let M = Int(readLine() ?? "") ?? 0
var edges: [Int: [Int]] = [:]
for _ in 0..<M {
    let UV = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
    let (U, V) = (UV[0], UV[1])
    edges[U, default: []].append(V)
    edges[V, default: []].append(U) // 양방향
}

var visited = [Bool](repeating: false, count: N + 1) // 해당 인덱스(정점)에 방문 여부 저장
var count = 0
func dfs(_ node: Int) {
    visited[node] = true
    for next in edges[node, default: []].sorted() where !visited[next] { // 인접한 정점 탐색
        count += 1
        dfs(next)
    }
}

dfs(1)
print(count)
