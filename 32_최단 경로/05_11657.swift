typealias Edge = (start: Int, end: Int, weight: Int)
let INF = 60_000_001

let nm = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (n, m) = (nm[0], nm[1])

var graph: [Edge] = []
while let input = readLine() {
    let abc = input.split { $0 == " " }.map { Int($0) ?? 0 }
    let (a, b, c) = (abc[0], abc[1], abc[2])
    graph.append(Edge(a, b, c))
}

func bellmanFord(start: Int) -> [Int]? {
    var minTimes = [Int](repeating: INF, count: n + 1)
    minTimes[1] = 0 // 시작 정점 초기화
    
    for i in 1...n { // 모든 node
        for j in 0..<m { // 모든 edge
            let currentNode = graph[j].start
            let nextNode = graph[j].end
            let weight = graph[j].weight
            
            if minTimes[currentNode] != INF,
                minTimes[currentNode] + weight < minTimes[nextNode] {
                minTimes[nextNode] = minTimes[currentNode] + weight

                if n == i { // 모든 간선을 돌고 한번 더 돌았을 때 업데이트가 있음 -> 음수 싸이클 존재
                    return nil
                }
            }
        }
    }

    return minTimes
}

if let minTimes = bellmanFord(start: 1) {
    minTimes[2...n].forEach { print($0 == INF ? -1 : $0) }
} else { // 최단거리를 구할 수 없는 그래프
    print(-1)
}

/*

 <벨만-포드 알고리즘>
 - 기능: 특정 출발 노드에서 다른 모든 노드까지의 최단 경로 탐색
 - 특징: 음수 가중치 간선이 있어도 수행 가능, 음수 싸이클 존재 여부 확인 가능
 - 그래프 형태: 간선 리스트로 구현
 
*/
