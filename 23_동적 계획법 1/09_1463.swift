// 방법 1) Bottom-up
let n = Int(readLine() ?? "") ?? 0

var dp = [Int](repeating: 0, count: n + 1) // 1~n까지 최소 연산 횟수 저장

for i in 2..<(n + 1) { // 2...1 이면 런타임 오류
    dp[i] = dp[i - 1] + 1
    if i % 2 == 0 {
        dp[i] = min(dp[i], dp[i / 2] + 1)
    }

    if i % 3 == 0 {
        dp[i] = min(dp[i], dp[i / 3] + 1)
    }
}

print(dp[n])
