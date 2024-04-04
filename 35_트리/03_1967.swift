typealias Node = (node: Int, weight: Int)

func dfs(_ node: Int, _ length: Int) {
    visited[node] = true

    if endNode.weight < length {
        endNode = Node(node, length)
    }

    for (next, weight) in graph[node] where !visited[next] {
        dfs(next, length + weight)
    }
}

let n = Int(readLine() ?? "") ?? 0
var graph = [[Node]](repeating: [], count: n + 1)
while let input = readLine() {
    let uvw = input.split { $0 == " " }.map { Int($0) ?? 0 }
    let (u, v, w) = (uvw[0], uvw[1], uvw[2])
    graph[u].append(Node(v, w))
    graph[v].append(Node(u, w))
}

var visited = [Bool](repeating: false, count: n + 1)
var endNode = Node(0, 0)

dfs(1, 0)

visited = [Bool](repeating: false, count: n + 1)

dfs(endNode.node, 0)

print(endNode.weight)
