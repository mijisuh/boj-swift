// 방법 1) reduce 함수로 곱해서 계산
let inputs = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let n = inputs[0], k = inputs[1]
let a = (1...max(1, n)).reduce(1, *)
let b = (1...max(1, n - k)).reduce(1, *) * (1...max(1, k)).reduce(1, *)

print(a / b)

// 방법 2) 재귀함수로 팩토리얼 계산
func factorial(_ n: Int) -> Int {
    if n == 0 || n == 1 { return 1 }
    return n * factorial(n - 1)
}

let inputs = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let n = inputs[0], k = inputs[1]

print(factorial(n) / factorial(n - k) / factorial(k))
