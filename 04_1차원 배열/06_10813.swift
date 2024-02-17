if let nmInput = readLine() {
    let nmArray = nmInput.split { $0 == " "}.map { Int($0) }
    if let n = nmArray[0], let m = nmArray[1] {
        var result = Array(1...n)
        for _ in 0..<m {
            if let basketInput = readLine() {
                let basketArray = basketInput.split { $0 == " " }.map { Int($0) }
                if let i = basketArray[0], let j = basketArray[1] {
                    result.swapAt(i-1, j-1)
                }
            }
        }
        print(result.map { String($0) }.joined(separator: " "))
    }
}


/*

[1~N 까지 값을 가지는 Array 생성]
-> Array(1...n)

[Array 요소들 순서 바꾸는 방법]
-> Array.swapAt(i, j)

*/