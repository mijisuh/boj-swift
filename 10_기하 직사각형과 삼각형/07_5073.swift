// MARK: 방법 1) Set 활용
func getTriangleInfo(_ a: Int, _ b: Int, _ c: Int) -> String {
    let length: Set<Int> = [a, b, c]

    let max = length.max() ?? 0
    let sum = a + b + c - max
    
    if sum <= max { return "Invalid" }
    
    if length.count == 1 {
        return "Equilateral"
    } else if length.count == 2 {
        return "Isosceles"
    } else {
        return "Scalene"
    }
}

while let input = readLine() {
    let inputArray = input.split { $0 == " " }.map { Int($0) ?? 0 }
    if inputArray[0] != 0 {
        print(getTriangleInfo(inputArray[0], inputArray[1], inputArray[2]))
    }
}

// MARK: 방법 2) 각 변의 길이를 직접 비교
func getTriangleInfo(_ a: Int, _ b: Int, _ c: Int) -> String {
    let max = [a, b, c].max() ?? 0
    let sum = a + b + c - max
    
    if sum <= max { return "Invalid" }
    
    if a == b && b == c {
        return "Equilateral"
    } else if a == b || b == c || a == c {
        return "Isosceles"
    } else {
        return "Scalene"
    }
}

while let input = readLine() {
    let inputArray = input.split { $0 == " " }
    if let a = Int(inputArray[0]), let b = Int(inputArray[1]), let c = Int(inputArray[2]) {
        if a != 0, b != 0, c != 0 {
            print(getTriangleInfo(a, b, c))
        }
    }
}
