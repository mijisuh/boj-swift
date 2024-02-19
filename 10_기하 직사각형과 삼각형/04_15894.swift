// 방법 1) 규칙..
if let input = readLine() {
    if let n = Int(input) {
        var result = n
        for _ in 0..<n {
            result += 1
        }
        result += 2 * n
        print(result)
    }
}

// 방법 2)
if let input = readLine() {
    if let n = Int(input) {
        print(n * 4)
    }
}
