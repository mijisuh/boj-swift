if let input = readLine() {
    let inputArray = input.split { $0 == " " }
    if let a = Int(inputArray[0]), let b = Int(inputArray[1]), let c = Int(inputArray[2]) {
        let array = [a, b, c].sorted()
        
        // 삼각형의 조건: 길이가 제일 긴 변의 길이 < 나머지 두 변의 길이
        if array[0] + array[1] <= array[2] {
            print((array[0] + array[1]) * 2 - 1)
        } else {
            print(a + b + c)
        }
    }
}

