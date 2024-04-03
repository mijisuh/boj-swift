func floydWarshall(_ from: Int, _ to: Int) {
    for k in 1...n {
        for from in 1...n {
            for to in 1...n {
                // 최소비용으로 갱신되는 경우에 경로 갱신
                if graph[from][k] + graph[k][to] < graph[from][to] {
                    graph[from][to] = graph[from][k] + graph[k][to]
                    // (from -> k 직전)경로 + (k -> to)경로
                    routes[from][to] = routes[from][k].dropLast() + routes[k][to]
                }
            }
        }
    }

    graph[1...].forEach {
        print($0[1...].map { String($0 == INF ? 0 : $0) }.joined(separator: " "))
    }

    routes[1...].forEach {
        $0[1...].forEach {
            print($0.count, $0.map { String($0) }.joined(separator: " "))
        }
    }
}

let n = Int(readLine() ?? "") ?? 0
let m = Int(readLine() ?? "") ?? 0

let INF = 10_000_000_001
var graph = [[Int]](repeating: [Int](repeating: INF, count: n + 1), count: n + 1)
for i in 1...n {
    graph[i][i] = 0
}

var routes = [[[Int]]](repeating: [[Int]](repeating: [], count: n + 1), count: n + 1)

while let input = readLine() {
    let uvw = input.split { $0 == " " }.map { Int($0) ?? 0 }
    let (u, v, w) = (uvw[0], uvw[1], uvw[2])
    if w < graph[u][v] {
        graph[u][v] = w
        routes[u][v] = [u, v] // u -> v 경로 정보 저장
    }
}

floydWarshall(1, n)
