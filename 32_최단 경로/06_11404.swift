let n = Int(readLine() ?? "") ?? 0
let m = Int(readLine() ?? "") ?? 0
let INF = 9_900_001

var dp = [[Int]](repeating: [Int](repeating: INF, count: n + 1), count: n + 1)
for i in 1...n {
    dp[i][i] = 0
}

while let input = readLine() {
    let abc = input.split { $0 == " " }.map { Int($0) ?? 0 }
    let (a, b, c) = (abc[0], abc[1], abc[2])
    dp[a][b] = min(dp[a][b], c)
}

for k in 1...n { // start ~ end 사이의 모든 경로
    for start in 1...n {
        for end in 1...n {
            // k를 거쳐가는게 더 빠른 경우 그 경로로 업데이트
            dp[start][end] = min(dp[start][end], dp[start][k] + dp[k][end])
        }
    }
}

var result = ""
for i in 1...n {
    for j in 1...n {
        result += dp[i][j] == INF ? "0 " : "\(dp[i][j]) "
    }
    result += "\n"
}
print(result)

/*

 <플로이드-워셜 알고리즘>
 - 기능: 모든 노드간 최대 경로 탐색
 - 특징: 음수 가중치 간선이 있어도 ok, DP 원리 사용
 - 시간 복잡도: O(V^3) (V: 노드의 개수) → 노드의 개수에 주의
 - 핵심 원리: 최단 경로는 부분 경로의 최단 경로로 이루어짐!
 - 점화식: dp[s][e] = min(dp[s][e], dp[s][k] + dp[k][e])
 
*/
