// 방법 1) 팩토리얼로 계산
// Int 표현 가능 범위를 넘을 수 있기 때문에 Double로 캐스팅
import Foundation
func factorial(_ n: Double) -> Double {
    if n <= 1 { return 1 }
    return n * factorial(n - 1)
}

let n = Int(readLine() ?? "") ?? 0
while let input = readLine() {
    let inputs = input.split { $0 == " " }.map { Int($0) ?? 0 }
    let n = Double(inputs[0]), m = Double(inputs[1])
    print(Int(round(factorial(m) / (factorial(n) * factorial(m - n)))))
}

// 방법 2) 조합 계산
func comb(_ n: Int, _ r: Int) -> Int {
    var result = 1
    for i in 1...r {
        result = result * (n - i + 1) / i
    }
    return result
}

let n = Int(readLine() ?? "") ?? 0
while let input = readLine() {
    let inputs = input.split { $0 == " " }.map { Int($0) ?? 0 }
    let n = inputs[0], m = inputs[1]
    print(comb(m, n))
}
