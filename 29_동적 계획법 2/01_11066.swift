_ = readLine()
while let k = Int(readLine() ?? "") {
    let array = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
    var dp = [[Int]](repeating: [Int](repeating: 0, count: k + 1), count: k + 1)
    var psum = [Int](repeating: 0, count: k + 1)

    for i in 1...k {
        psum[i] = psum[i - 1] + array[i - 1]
    }

    for i in 1..<k { // gap
        for start in 1...(k - i) {
            let end = start + i
            
            var temp = Int.max
            for mid in start..<end {
                temp = min(temp, dp[start][mid] + dp[mid + 1][end] + psum[end] - psum[start - 1])
            }
            dp[start][end] = temp
        }
    }

    print(dp[1][k])
}
