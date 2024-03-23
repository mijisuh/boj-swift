let NMR = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (N, M, R) = (NMR[0], NMR[1], NMR[2])
var dict: [Int: [Int]] = [:]
for _ in 0..<M {
    let UV = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
    let (U, V) = (UV[0], UV[1])
    dict[U, default: []].append(V)
    dict[V, default: []].append(U) // 양방향
}

var visited = [Int](repeating: 0, count: N + 1)
var depth = 1
func dfs(_ node: Int) {
    visited[node] = depth
    for next in dict[node, default: []].sorted() {
        if visited[next] == 0 {
            depth += 1
            dfs(next)
        }
    }
}

dfs(R)
print(visited[1...].map { String($0) }.joined(separator: "\n"))
