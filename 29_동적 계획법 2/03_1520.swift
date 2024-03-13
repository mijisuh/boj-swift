let inputs = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (m, n) = (inputs[0], inputs[1])
let heights = (0..<m).map { _ in
    (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
}

var dp = [[Int]](repeating: [Int](repeating: -1, count: n), count: m)

let dRow = [0, 1, 0, -1]
let dCol = [1, 0, -1, 0]

func isValid(_ row: Int, _ col: Int) -> Bool { // 유효범위 체크.
    return (0..<m) ~= row && (0..<n) ~= col
}

func dfs(_ row: Int, _ col: Int) -> Int {
    if row == m - 1, col == n - 1 { return 1 } // 도착 시

    if dp[row][col] == -1 { // 미방문 좌표인 경우
        dp[row][col] = 0 // 방문했음을 나타냄

        for i in 0..<4 {
            let nRow = row + dRow[i]
            let nCol = col + dCol[i]

            if isValid(nRow, nCol), heights[nRow][nCol] < heights[row][col] {
                dp[row][col] += dfs(nRow, nCol)
            }
        }
    }

    return dp[row][col] // 방문 좌표인 경우
}

print(dfs(0, 0))
