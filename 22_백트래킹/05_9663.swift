func isAvailable(_ candidate: [Int], _ currentCol: Int) -> Bool {
    let currentRow = candidate.count // 현재 행을 알 수 있음

    for queenRow in 0..<currentRow {
        // 수직 체크 || 대각선 체크
        if candidate[queenRow] == currentCol || abs(candidate[queenRow] - currentCol) == currentRow - queenRow {
            return false
        }
    }

    return true
}

func dfs(_ n: Int, _ currentRow: Int, _ currentCandidate: inout [Int], _ result: inout [[Int]]) {
    if currentRow == n { // 마지막 행(배치가 끝남)
        result.append(currentCandidate)
        return
    }

    for candidateCol in 0..<n { // 열 이동
        if isAvailable(currentCandidate, candidateCol) { // 조건 체크
            currentCandidate.append(candidateCol)
            dfs(n, currentRow + 1, &currentCandidate, &result) // 다음 행으로 넘어감
            currentCandidate.popLast() // 지금까지의 배치로는 다음 행에 퀸을 놓을 자리가 없음 -> 백 트랙(최근에 append 했던 걸 pop)
        }
    }
}

func solveNQueen(_ n: Int) -> [[Int]] {
    var result: [[Int]] = []
    var currentCandidate: [Int] = []
    dfs(n, 0, &currentCandidate, &result)
    return result
}

let n = Int(readLine() ?? "") ?? 0
print(solveNQueen(n).count)
