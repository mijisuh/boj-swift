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
