// 방법 1) 배열을 함수에 call by reference로 전달
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

// 방법 2) 2차원 배열 2개로 풀이
let n = Int(readLine() ?? "") ?? 0

var board = [Int](repeating: -1, count: n) // 각 depth에서 퀸의 열 위치
var visited = [Bool](repeating: false, count: n)
var count = 0

func isAvailable(_ depth: Int) -> Bool {
    for i in 0..<depth { // 이전 depth의 퀸 위치와 비교
        if board[i] == board[depth] { // 열 검사
            return false
        }

        if abs(board[i] - board[depth]) == abs(i - depth) { // 대각선 검사
            return false
        }
    }

    return true
}

func dfs(_ depth: Int) {
    print(visited)
    print(board)
    if depth == n {
        count += 1
        return
    }

    for i in 0..<n { // 열에서 퀸 위치: 0~(n-1)
        if !visited[i] { // 해당 열이 false면 그 열 모두 방문할 필요 X
            board[depth] = i
            if isAvailable(depth) {
                visited[i] = true
                dfs(depth + 1)
                visited[i] = false
            }
        }
    }
}

dfs(0)
print(count)
