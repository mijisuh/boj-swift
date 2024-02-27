import Foundation

var sudoku: [[Int]] = []
while let input = readLine() {
    let array = input.split { $0 == " " }.map { Int($0) ?? 0 }
    sudoku.append(array)
}

var blanks: [(Int, Int)] = [] // 빈 칸 좌표 배열
for i in 0..<9 {
    for j in 0..<9 {
        if sudoku[i][j] == 0 {
            blanks.append((i, j))
        }
    }
}

func findColumn(_ col: Int, _ n: Int) -> Bool { // 세로줄 검사
    for i in 0..<9 {
        if sudoku[i][col] == n {
            return true
        }
    }
    return false
}

func findRow(_ row: Int, _ n: Int) -> Bool { // 가로줄 검사
    for i in 0..<9 {
        if sudoku[row][i] == n {
            return true
        }
    }
    return false
}

func findRect(_ row: Int, _ col: Int, _ n: Int) -> Bool { // 3 * 3 영역 검사
    for i in 0..<3 {
        for j in 0..<3 {
            if sudoku[row / 3 * 3 + i][col / 3 * 3 + j] == n {
                return true
            }
        }
    }
    return false
}

func find(_ n: Int) {
    if n == blanks.count { // 모든 빈 칸을 채우면
        for i in 0..<9 {
            for j in 0..<9 {
                print(sudoku[i][j], terminator: " ")
            }
            print()
        }
        exit(0)
    }

    for i in 1...9 {
        let row = blanks[n].0
        let col = blanks[n].1
        if !findColumn(col, i) && !findRow(row, i) && !findRect(row, col, i) {
            sudoku[row][col] = i
            find(n + 1)
            sudoku[row][col] = 0 // 해당 숫자가 답이 아닐 수도 있으므로 0으로 복귀 후 다음 탐색 실행
        }
    }
}

find(0)
