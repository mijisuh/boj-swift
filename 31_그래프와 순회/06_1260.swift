let NMV = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (N, M, V) = (NMV[0], NMV[1], NMV[2])
var edges = [[Int]](repeating: [Int](repeating: 0, count: 0), count: N + 1)
for _ in 0..<M {
    let UV = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
    let (U, V) = (UV[0], UV[1])
    edges[U].append(V)
    edges[V].append(U) // 양방향
}

var result = ""
var visited = [Bool](repeating: false, count: N + 1) // 해당 인덱스(정점)에 방문 여부 저장
var order = 1

func dfs(_ node: Int) {
    visited[node] = true
    result += "\(node) "
    for next in edges[node].sorted() where !visited[next] { // 인접한 정점 중 방문하지 않은 정점 탐색
        order += 1
        dfs(next)
    }
}

dfs(V)
result += "\n"

visited = [Bool](repeating: false, count: N + 1)
order = 1

func bfs(_ node: Int) {
    var queue = [node]
    var index = 0

    visited[node] = true
    result += "\(node) "
    while queue.count > index {
        for next in edges[queue[index]].sorted() where !visited[next] {
            queue.append(next)
            order += 1
            visited[next] = true
            result += "\(next) "
        }
        index += 1
    }
}

bfs(V)

print(result)
