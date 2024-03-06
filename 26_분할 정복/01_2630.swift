let n = Int(readLine() ?? "") ?? 0
var paper: [[Int]] = (0..<n).map { _ in
    (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
}
var (whiteCount, blueCount) = (0, 0)

func dfs(_ xStart: Int, _ yStart: Int, _ length: Int) {
    if length == 1 {
        if paper[xStart][yStart] == 1 {
            blueCount += 1
        } else {
            whiteCount += 1
        }
    } else {
        let color = paper[xStart][yStart] // 첫번째 색
        var cut = true
        loop: for i in xStart..<(xStart + length) {
            for j in yStart..<(yStart + length) {
                if paper[i][j] != color { // 첫번째 색과 색이 하나라도 다르면
                    cut = false
                    break loop
                }
            }
        }
        
        if cut {
            if color == 0 {
                whiteCount += 1
            } else {
                blueCount += 1
            }
        } else {
                        // 색종이를 4등분
            dfs(xStart, yStart, length / 2)
            dfs(xStart, yStart + length / 2, length / 2)
            dfs(xStart + length / 2, yStart, length / 2)
            dfs(xStart + length / 2, yStart + length / 2, length / 2)
        }
    }
}

dfs(0, 0, n)
print(whiteCount)
print(blueCount)

/*

 레이블을 이용하여 반복문에 이름 부여 ex) loop: for ~
 → 중첩된 반복문에서 특정 반복문으로 점프할 때 유용
 
*/
