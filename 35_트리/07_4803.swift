// 방법 1) BFS
func isCycle(_ start: Int, _ graph: [[Int]], _ visited: inout [Bool]) -> Bool {
    var queue = [start]
    var index = 0
    var isCycle = false

    while index < queue.count {
        let current = queue[index]
        index += 1

        // 큐에 넣을 때가 아닌 뽑을 때 방문 체크
        if visited[current] {
            isCycle = true
        }

        visited[current] = true

        for next in graph[current] where !visited[next] {
            queue.append(next) // 중복 가능
        }
    }
    
    return isCycle
}

var caseNum = 1
while let input = readLine() {
    let nm = input.split { $0 == " " }.map { Int($0) ?? 0 }
    let (n, m) = (nm[0], nm[1])

    if (n, m) != (0, 0) {
        var graph = [[Int]](repeating: [], count: n + 1)
        (0..<m).forEach { _ in
            let uv = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
            let (u, v) = (uv[0], uv[1])
            graph[u].append(v)
            graph[v].append(u)
        }

        var visited = [Bool](repeating: false, count: n + 1)
        var count = 0
        for i in 1...n {
            if !visited[i], !isCycle(i, graph, &visited) {
                count += 1
            }
        }

        switch count {
            case 0:
            print("Case \(caseNum): No trees.")
            case 1:
            print("Case \(caseNum): There is one tree.")
            default:
            print("Case \(caseNum): A forest of \(count) trees.")
        }

        caseNum += 1
    }
}

// 방법 2) DFS
func isTree(_ prev: Int, _ current: Int, _ graph: [[Int]], _ visited: inout [Bool]) -> Bool {
    visited[current] = true

    for next in graph[current] {
        if next == prev { continue } // 다음과 이전이 같은 경우, 같은 경로를 뜻하므로 무시

        if visited[next] { return false } // next != prev, 이미 방문한 경우 사이클이 생기므로 트리가 아님

        // next != prev, 사이클이 없는 경우 DFS 수행
        // DFS 수행 도중 사이클이 생기면 false가 반환됨 -> 재귀적으로 false 반환
        if !isTree(current, next, graph, &visited) { return false }
    }

    // DFS 수행 도중 사이클이 생기지 않으면 true 반환
    return true
}

var caseNum = 1
while let input = readLine() {
    let nm = input.split { $0 == " " }.map { Int($0) ?? 0 }
    let (n, m) = (nm[0], nm[1])

    if (n, m) != (0, 0) {
        var graph = [[Int]](repeating: [], count: n + 1)
        (0..<m).forEach { _ in
            let uv = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
            let (u, v) = (uv[0], uv[1])
            graph[u].append(v)
            graph[v].append(u)
        }

        var visited = [Bool](repeating: false, count: n + 1)
        var count = 0
        for i in 1...n {
            if !visited[i], isTree(0, i, graph, &visited) {
                count += 1
            }
        }

        switch count {
            case 0:
            print("Case \(caseNum): No trees.")
            case 1:
            print("Case \(caseNum): There is one tree.")
            default:
            print("Case \(caseNum): A forest of \(count) trees.")
        }

        caseNum += 1
    }
}
