let nm = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (n, m) = (nm[0], nm[1])
let INF = n * (n - 1) * 10_000 + 1

var dp = [[Int]](repeating: [Int](repeating: INF, count: n + 1), count: n + 1)
// 싸이클이 있으면 시작 -> 시작이 0이 아닐 수도 있음
// for i in 1...n {
//     dp[i][i] = 0
// }

while let input = readLine() {
    let abc = input.split { $0 == " " }.map { Int($0) ?? 0 }
    let (a, b, c) = (abc[0], abc[1], abc[2])
    dp[a][b] = c
}

// 플로이드-워셜 알고리즘 활용
for k in 1...n {
    for start in 1...n {
        for end in 1...n {
            dp[start][end] = min(dp[start][end], dp[start][k] + dp[k][end])
        }
    }
}

var answer = INF
for i in 1...n {
    answer = min(answer, dp[i][i]) // 싸이클: 시작 -> 시작
}
print(answer == INF ? -1 : answer)
