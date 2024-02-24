// MARK: 방법 1) Array.reverse() 이용
if let nmInput = readLine() {
    let nmArray = nmInput.split { $0 == " " }.map { Int($0) }
    if let n = nmArray[0], let m = nmArray[1] {
        var result = Array(1 ... n)
        while let basketInput = readLine() {
            let basketArray = basketInput.split { $0 == " " }.map { Int($0) }
            if let i = basketArray[0], let j = basketArray[1] {
                var tempArray = Array(result[(i-1) ... (j-1)])
                tempArray.reverse()
                for idx in 0 ..< tempArray.count {
                    result[i - 1 + idx] = tempArray[idx]
                }
            }
        }
        print(result.map { String($0) }.joined(separator: " "))
    }
}

// MARK: 방법 2) Array.swapAt() 이용
if let nmInput = readLine() {
    let nmArray = nmInput.split { $0 == " " }.map { Int($0) }
    if let n = nmArray[0], let m = nmArray[1] {
        var result = Array(1 ... n)
        while let basketInput = readLine() {
            let basketArray = basketInput.split { $0 == " " }.map { Int($0) }
            if let i = basketArray[0], let j = basketArray[1] {
                var (start, end) = (i, j)
                while (start < end) {
                    result.swapAt(start-1, end-1)
                    start += 1
                    end -= 1
                }
            }
        }
        print(result.map { String($0) }.joined(separator: " "))
    }
}


/*

** 배열 슬라이스는 원래 배열의 일부를 참조하는 것이기 때문에 별도의 배열을 만들지 않음!
따라서 원래 배열의 범위를 벗어나는 경우에 Index out of range 에러가 발생하기 때문에
슬라이스를 만들 때 복사본을 만들어 사용해야 함 (Array의 init 메서드)

*/
