let n = Int(readLine() ?? "") ?? 0

var wines = [Int](repeating: 0, count: n + 2)
var dp = [Int](repeating: 0, count: n + 2)

for i in 1...n {
    wines[i] = Int(readLine() ?? "") ?? 0
}

dp[1] = wines[1]
dp[2] = wines[1] + wines[2]

if n > 2 {
    for i in 3...n {
        let first = dp[i - 2] + wines[i] // 현재 앞에서 건너뛰기
        let second = dp[i - 3] + wines[i - 1] + wines[i] // 현재 앞앞에서 건너뛰기
        let third = dp[i - 1] // 현재에서 건너뛰기
        dp[i] = max(first, second, third)
    }
}
print(dp[n])
