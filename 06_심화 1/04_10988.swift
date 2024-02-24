// MARK: 방법 1) 양 끝 비교
if let input = readLine() {
    let inputArray = Array(input)
    var count = 0
    for i in 0..<inputArray.count/2 {
        if inputArray[i] == inputArray[inputArray.count - 1 - i] {
            count += 1
        } else {
            break
        }
    }
    
    count == inputArray.count/2 ? print("1") : print("0")
}

// MARK: 방법 2) String.reversed() 활용
if let input = readLine() {
    let reversed = String(input.reversed())
    input == reversed ? print("1") : print("0")
}
