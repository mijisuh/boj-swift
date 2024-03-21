let n = Int(readLine() ?? "") ?? 0
var heights = (0..<n).map { _ in
    Int(readLine() ?? "") ?? 0
}

heights.append(0)
var stack: [(pos: Int, height: Int)] = [(0, heights[0])] // pos와 height가 오름차순으로 들어옴
var maxArea = heights[0]

for i in 1...n {
    var lastPos = i
    while let last = stack.last, heights[i] < last.height { // stack의 오름차 순서가 깨질 때
        lastPos = last.pos
        maxArea = max(maxArea, (i - lastPos) * last.height)
        stack.removeLast()
    }
    stack.append((lastPos, heights[i]))
}

print(maxArea)
