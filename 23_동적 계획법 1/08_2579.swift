let n = Int(readLine() ?? "") ?? 0

var floors = [Int](repeating: 0, count: n + 2)
var dp = [Int](repeating: 0, count: n + 2)

for i in 1...n {
    floors[i] = Int(readLine() ?? "") ?? 0
}
dp[1] = floors[1]
dp[2] = floors[1] + floors[2]
if n > 2 {
    for i in 3...n {
        dp[i] = max(dp[i - 3] + floors[i - 1] + floors[i], dp[i - 2] + floors[i])
        // 반드시 자기 자신을 포함해야 함(도착지 기준)
    }
}

print(dp[n]) 
