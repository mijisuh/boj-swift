func solve(_ h: [Int], _ n: Int) -> Int {
    var stack = [(pos: 0, height: h[0])] // 현재 위치보다 낮은 높이 값을 가지는 직사각형들을 나타내는 정보
    var maxValue = h[0]
    for i in 1..<n {
        var stackLastPos = i
        while let stackLast = stack.last, stackLast.height > h[i] { // 스택에 있는 높이 값이 현재 위치의 높이 값보다 큰 경우
            stackLastPos = stackLast.pos
            maxValue = max(maxValue, (i - stackLastPos) * stackLast.height) // 넓이 비교
            stack.popLast()
        }
        stack.append((stackLastPos, h[i])) // (현재 높이 값보다 큰 직사각형 중 제일 작은 직사각형의 위치,현재 높이 값)
    }
    return maxValue
}

while let input = readLine(), input != "0" {
    let inputs = input.split { $0 == " " }.map { Int($0) ?? 0 }
    let (n, h) = (inputs[0], inputs[1...])
    
    print(solve(Array(h) + [0], n + 1)) // 마지막에 stack에 있는 값을들 다 꺼내기 위해 마지막 h값은 0
}
