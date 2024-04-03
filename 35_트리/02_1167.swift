typealias Node = (node: Int, dist: Int)

func dfs(_ node: Int, _ length: Int) {
    visited[node] = true
    
    if endNode.dist < length { // 현재 길이가 이전보다 길다면
        endNode = (node, length) // 하위노드의 최대 길이 값 갱신
    }

    for (next, dist) in graph[node] {
        if !visited[next] {
            dfs(next, length + dist) // 현재까지의 길이 + 이동한 노드의 길이
        }
    }
}

let n = Int(readLine() ?? "") ?? 0
var graph = [[Node]](repeating: [], count: n + 1)
while let input = readLine() {
    let inputs = input.split { $0 == " " }.map { Int($0) ?? 0 }
    for j in stride(from: 1, to: inputs.count - 1, by: 2) {
        graph[inputs[0]].append((inputs[j], inputs[j + 1]))
    }
}

var visited = [Bool](repeating: false, count: n + 1)
var endNode: Node = (0, 0)

// 1) 가장 하위 레벨의 노드 찾기
dfs(1, 0) // 임의의 노드에서 가장 먼 곳에 있음

visited = [Bool](repeating: false, count: n + 1)

// 2) 하위 노드에서 가장 멀리 있는 노드 찾기
dfs(endNode.node, 0)

print(endNode.dist)


/*

 <트리의 지름>
 - 트리에서 어떤 두 노드를 선택해서 양쪽으로 잡아 당길 때 가장 길게 늘어나는 경우, 트리의 모든 노드는 이 두 노드를 끝 점으로 하는 원 안에 들어갈 것임
 - 그 두 노드는 반드시 트리의 가장 하위 레벨에 있는 노드
 
*/
