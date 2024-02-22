// 방법 1) 범위 좁혀가면서 소수 판별
func isPrime(_ num: Int) -> Bool {
    if num < 2 { return false }
    var i = 2
    while i * i <= num {
        if num % i == 0 {
            return false
        } else {
            i += 1
        }
    }
    return true
}

let inputArray = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let m = inputArray[0], n = inputArray[1]

for num in m...n {
    if isPrime(num) {
        print(num)
    }
}

// 방법 2) 에라토스테네스의 체 사용 -> 범위가 정해져 있을 때 사용
// 시간: 352 ms(방법 1) -> 236 ms
let inputArray = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let m = inputArray[0], n = inputArray[1]
var array = Array(repeating: 1, count: n + 1) // 소수인 경우 1, 소수가 아닌 경우 0 인 정보 배열

for i in 2..<n {
    for j in stride(from: i + i, through: n, by: i) { // 2, 3, ... 의 배수
        array[j] = 0  // 소수가 아닌 값들
    }
}

for i in m...n {
    if i > 1, array[i] == 1 {
        print(i)
    }
}
