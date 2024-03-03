// 방법 1) 2차원 dp 배열 활용
let nk = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (n, k) = (nk[0], nk[1])

var stuffs: [(weight: Int, value: Int)] = [(0, 0)]
while let input = readLine() {
    let inputs = input.split { $0 == " " }.map { Int($0) ?? 0 }
    stuffs.append((weight: inputs[0], value: inputs[1]))
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: k + 1), count: n + 1)

for i in 0...n {
    for j in 0...k {
        if i == 0 {
            dp[0][j] = stuffs[0].value
        } else {
            if stuffs[i].weight > j {
                dp[i][j] = dp[i - 1][j]
            } else {
                dp[i][j] = max(dp[i - 1][j - stuffs[i].weight] + stuffs[i].value, dp[i - 1][j])
            }
        }
    }
}

print(dp.last?.last ?? 0)
