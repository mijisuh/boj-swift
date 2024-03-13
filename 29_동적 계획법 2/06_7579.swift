// 방법 1) 2차원 배열
let nm = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (n, m) = (nm[0], nm[1])
let memories = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let costs = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 } // 비활성화 비용
var maxCost = costs.reduce(0, +)

// dp[i][cost의 총 합]: i번째 앱까지의 메모리 총 합
var dp = [[Int]](repeating: [Int](repeating: 0, count: maxCost + 1), count: n + 1)

for i in 1...n {
    for j in 0...maxCost { // 1부터 시작하면 런타임 에러 -> 비활성화 비용이 0인 경우도 생각!
        dp[i][j] = dp[i - 1][j]
        if j - costs[i - 1] >= 0 { // 해당 앱의 cost가 현재 cost 범위 안에 있어 추가 가능
            dp[i][j] = max(dp[i][j], dp[i - 1][j - costs[i - 1]] + memories[i - 1])
        }
    }
}

// 메모리의 총 합이 m보다 큰 것 중 cost가 제일 작은 것
for (idx, memory) in dp[n].enumerated() {
    if memory >= m {
        print(idx)
        break
    }
}
