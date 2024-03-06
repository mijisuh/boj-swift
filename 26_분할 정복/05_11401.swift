let inputs = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (n, k) = (inputs[0], inputs[1])
let p = 1_000_000_007

func factorial(_ n: Int) -> Int {
    if n == 0 { return 1 }
    var result = 1
    for i in 1...n {
        result = (result * i) % p // 팩토리얼 계산시에 매번 계산마다 큰 소수인 p로 나머지를 구하여 메모리 오버, 타임오버를 피하기 -> 재귀 호출 X
    }
    return result
}

func pow(_ n: Int, _ i: Int) -> Int {
    if i == 0 { return 1 }

    let half = pow(n, i / 2)
    if i % 2 == 0 {
        return half * half % p
    } else {
        return half * half % p * n % p
    }
}

let numer = factorial(n)
let denom = pow(factorial(k) * factorial(n - k) % p, p - 2) // 페르마의 소정리
let result = (numer * denom) % p
print(result)
