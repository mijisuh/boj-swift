// LCS[i][j] (Xi, Yj의 최장 공통 부분 수열의 길이)
// = LCS[i-1][j-1] + 1 (Xi == Yj)
// = max(LCS[i][j-1], LCS[i-1][j]) (Xi != Yi)
var array1 = Array(readLine() ?? "")
var array2 = Array(readLine() ?? "")
var dp = [[Int]](repeating: [Int](repeating: 0, count: array2.count + 1), count: array1.count + 1)

for i in 1...array1.count {
    for j in 1...array2.count {
        if array1[i - 1] == array2[j - 1] {
            dp[i][j] = dp[i - 1][j - 1] + 1
        } else {
            dp[i][j] = max(dp[i][j - 1], dp[i - 1][j])
        }
    }
}

print(dp.last?.last ?? 0)
