let n = Int(readLine() ?? "") ?? 0

var dp = [[Int]](repeating: [Int](repeating: 1, count: 10), count: n)
dp[0][0] = 0
for i in 1..<n { // 총 글자수
    for j in 0...9 { // 마지막 자릿수의 수
        if j == 0 {
            dp[i][j] = dp[i - 1][1] % 1_000_000_000
        } else if j == 9 {
            dp[i][j] = dp[i - 1][8] % 1_000_000_000
        } else {
            dp[i][j] = (dp[i - 1][j - 1] + dp[i - 1][j + 1]) % 1_000_000_000
        }
    }
}

print(dp[n - 1].reduce(0, +) % 1_000_000_000)
