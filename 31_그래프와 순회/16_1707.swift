// 이분 그래프를 찾기 위해 노드에 색을 칠하는 방법 이용
// 이전 노드와 현재 노드의 색이 다르면 이분 그래프
let k = Int(readLine() ?? "") ?? 0
for _ in 0..<k {
    let ve = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
    let (v, e) = (ve[0], ve[1])

    var graph = [[Int]](repeating: [], count: v + 1)
    for _ in 0..<e {
        let edge = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
        graph[edge[0]].append(edge[1])
        graph[edge[1]].append(edge[0])
    }

    var visited = [Int](repeating: -1, count: v + 1) // 색상 정보

    var isBipartite = true

    outerLoop: for i in 1...v where visited[i] == -1 { // 모든 정점 탐색
                visited[i] = 0 // 0은 RED, 1은 BLUE라고 가정
    
        var queue = [i]
        var index = 0
        
        while queue.count > index, isBipartite {
            let node = queue[index]
            
            for next in graph[node] { // 인접한 노드 값이 없으면 반대 색상 채우고, 있으면 비교
                if visited[next] == -1 {
                    visited[next] = visited[node]^1 // XOR 연산자(두 값이 같으면 0, 다르면 1)
                    queue.append(next)
                } else if visited[next] == visited[node] {
                    isBipartite = false
                    break outerLoop
                }
            }
    
            index += 1
        }
    }

    print(isBipartite ? "YES" : "NO")
}
