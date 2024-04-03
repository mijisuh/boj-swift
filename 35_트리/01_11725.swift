let n = Int(readLine() ?? "") ?? 0
var graph = [[Int]](repeating: [], count: n + 1)
while let input = readLine() {
    let uv = input.split { $0 == " " }.map { Int($0) ?? 0 }
    let (u, v) = (uv[0], uv[1])
    graph[u].append(v)
    graph[v].append(u)
}

var parents = [Int](repeating: 0, count: n + 1)

var queue = [1]
var index = 0

while queue.count > index {
    let current = queue[index]
    index += 1

    for next in graph[current] where parents[next] == 0 { // 다음 탐색할 노드가 현재 노드의 자식 노드
        parents[next] = current // 인덱스: 현재 노드, 값: 부모 노드
        queue.append(next)
    }
}

parents[2...].forEach {
    print($0)
}
