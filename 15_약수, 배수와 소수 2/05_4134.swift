// 방법 1) sqrt() 이용
import Foundation

func isPrime(_ num: Int) -> Bool {
    if num < 2 { return false }
    
    for i in 2..<Int(sqrt(Double(num)) + 1) { // 2 ~ √num 까지만 탐색 안하면 시간 초과
        if num % i == 0 { return false }
    }
    
    return true
}

let n = Int(readLine() ?? "") ?? 0
while let input = Int(readLine() ?? "") {
    var num = input
    while !isPrime(num) { num += 1 }
    print(num)
}

// 방법 2) 제곱하면서 범위 줄여나감
func isPrime(_ num: Int) -> Bool {
    if num < 2 { return false }
    var i = 2
    while i * i <= num { // 4, 9, 16, ...
        if num % i == 0 {
            return false
        } else {
            i += 1
        }
    }
    return true
}

let n = Int(readLine() ?? "") ?? 0
while let input = Int(readLine() ?? "") {
    var num = input
    while !isPrime(num) { num += 1 }
    print(num)
}
