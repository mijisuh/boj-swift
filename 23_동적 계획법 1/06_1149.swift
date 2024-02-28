// 백트래킹 -> 시간초과
// 점화식 세워서 DP로 풀이
let n = Int(readLine() ?? "") ?? 0
var prices: [[Int]] = []
while let input = readLine() {
    prices.append(input.split { $0 == " " }.map { Int($0) ?? 0 })
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n)
dp[0] = prices[0]
for i in 1..<n { // i번째 집의 색상 선택
    // R을 선택했을 때 최소비용은 이전 집에서 G, B 중 최소 비용 값 + 현재 집의 R 비용
    dp[i][0] = min(dp[i - 1][1], dp[i - 1][2]) + prices[i][0]
    // G를 선택했을 때 최소비용은 이전 집에서 R, G 중 최소 비용 값 + 현재 집의 G 비용
    dp[i][1] = min(dp[i - 1][0], dp[i - 1][2]) + prices[i][1]
    // B를 선택했을 때 최소비용은 이전 집에서 R, G 중 최소 비용 값 + 현재 집의 B 비용
    dp[i][2] = min(dp[i - 1][0], dp[i - 1][1]) + prices[i][2]
}

print(dp.last?.min() ?? 0)
