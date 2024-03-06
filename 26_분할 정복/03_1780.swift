let n = Int(readLine() ?? "") ?? 0
var paper = (0..<n).map { _ in
    (readLine() ?? " ").split { $0 == " " }.map { Int($0) ?? 0 }
}

var countDict: [Int: Int] = [:]

func cut(_ xStart: Int, _ yStart: Int, _ length: Int, _ color: Int) -> Bool {
    for i in xStart..<(xStart + length) {
        for j in yStart..<(yStart + length) {
            if paper[i][j] != color { return false }
        }
    }
    return true
}

func dfs(_ xStart: Int, _ yStart: Int, _ length: Int) {
    let color = paper[xStart][yStart]
    if cut(xStart, yStart, length, color) {
        countDict[color, default: 0] += 1
    } else {
        let dividedLength = length / 3
        for i in 0..<3 {
            for j in 0..<3 {
                dfs(xStart + dividedLength * i, yStart + dividedLength * j, dividedLength)
            }
        }
    }
}

dfs(0, 0, n)

[-1, 0, 1].forEach { print(countDict[$0] ?? 0) }
