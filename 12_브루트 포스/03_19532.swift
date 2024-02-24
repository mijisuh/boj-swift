// MARK: 방법 1) 완전 탐색
if let input = readLine() {
    let inputArray = input.split { $0 == " " }.map { Int($0) ?? 0 }
    
    for x in -999...999 {
        for y in -999...999 {
            if inputArray[0] * x + inputArray[1] * y == inputArray[2]
                && inputArray[3] * x + inputArray[4] * y == inputArray[5] {
                    print(x, y)
                }
        }
    }
}

// MARK: 방법 2) 연립방정식 풀이
if let input = readLine() {
    let inputArray = input.split { $0 == " " }
    
    if let a = Int(inputArray[0]), let b = Int(inputArray[1]),
        let c = Int(inputArray[2]), let d = Int(inputArray[3]),
        let e = Int(inputArray[4]), let f = Int(inputArray[5]) {
            let x = (c * e - b * f) / (a * e - b * d)
            let y = (c * d - a * f) / (b * d - a * e)
            print(x, y)
        }
}
