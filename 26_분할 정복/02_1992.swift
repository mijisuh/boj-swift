let n = Int(readLine() ?? "") ?? 0
var video = (0..<n).map { _ in
    (readLine() ?? "").map { String($0) }
}
var result = ""

func compress(_ xStart: Int, _ yStart: Int, _ length: Int) -> Bool {
    let color = video[xStart][yStart]
    for i in xStart..<(xStart + length) {
        for j in yStart..<(yStart + length) {
            if video[i][j] != color { return false }
        }
    }
    return true
}

func dfs(_ xStart: Int, _ yStart: Int, _ length: Int) {
    if compress(xStart, yStart, length) {
        result += video[xStart][yStart]
    } else {
        result += "("
        dfs(xStart, yStart, length / 2)
        dfs(xStart, yStart + length / 2, length / 2)
        dfs(xStart + length / 2, yStart, length / 2)
        dfs(xStart + length / 2, yStart + length / 2, length / 2)
        result += ")"
    }
}

dfs(0, 0, n)
print(result)
