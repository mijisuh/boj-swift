// dp[시작][끝] = min(dp[시작][끝], dp[시작][중간점] + dp[중간점][끝] + 행렬 곱 연산 수)
let n = Int(readLine() ?? "") ?? 0
var r: [Int] = []
var c: [Int] = []
var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

while let input = readLine() {
    let inputs = input.split { $0 == " " }.map { Int($0) ?? 0}
    r.append(inputs[0])
    c.append(inputs[1])
}

for len in 1..<n {
    for start in 0..<(n - len) {
        let end = start + len
        
        var temp = Int.max
        for mid in start..<end {
            temp = min(temp, dp[start][mid] + dp[mid + 1][end] + r[start] * c[mid] * c[end])
        }
        dp[start][end] = temp
    }
}

print(dp[0][n - 1])

// Top-down -> 시간 초과
let n = Int(readLine() ?? "") ?? 0
var r: [Int] = []
var c: [Int] = []
var dp = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: n)

while let input = readLine() {
    let inputs = input.split { $0 == " " }.map { Int($0) ?? 0}
    r.append(inputs[0])
    c.append(inputs[1])
}

func solve(_ start: Int, _ end: Int) -> Int {
    if dp[start][end] != Int.max { return dp[start][end] }
    
    if start == end {
        dp[start][end] = 0
        return dp[start][end]
    }

    if end - start == 1 {
        dp[start][end] = r[start] * c[start] * c[end]
        return dp[start][end]
    }

    for i in start..<end {
        dp[start][end] = min(dp[start][end], solve(start, i) + solve(i + 1, end) + r[start] * c[i] * c[end])
    }

    return dp[start][end]
}

print(solve(0, n - 1))
