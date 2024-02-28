// 방법 1)
let n = Int(readLine() ?? "") ?? 0
var inputs: [[Int]] = []

while let input = readLine() {
    inputs.append(input.split { $0 == " " }.map { Int($0) ?? 0 })
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
dp[0] = inputs[0]
for i in 1..<n {
    for j in 0...i {
        if j == 0 {
            dp[i][j] = dp[i - 1][0] + inputs[i][j]
        } else if j == i {
            dp[i][j] = dp[i - 1][j - 1] + inputs[i][j]
        } else {
            dp[i][j] = max(dp[i - 1][j - 1], dp[i - 1][j]) + inputs[i][j]
        }
    }
}

print(dp.last?.max() ?? 0)

// 방법 2)
let n = Int(readLine() ?? "") ?? 0
var inputs: [[Int]] = []

while let input = readLine() {
    inputs.append(input.split { $0 == " " }.map { Int($0) ?? 0 })
}

for i in 1..<n {
    print(inputs)
    for j in 0...i {
        let left = j - 1 < 0 ? 0 : inputs[i - 1][j - 1]
        let right = j > i - 1 ? 0 : inputs[i - 1][j]
        inputs[i][j] += max(left, right)
    }
}

print(inputs.last?.max() ?? 0)
