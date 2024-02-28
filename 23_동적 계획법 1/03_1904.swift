// 방법 1) 메모이제이션
let n = Int(readLine() ?? "") ?? 0
var cache = [Int](repeating: 0, count: n + 1)

for i in 1...n {
    if i <= 3 {
        cache[i] = i
    } else {
        cache[i] = (cache[i - 1] + cache[i - 2]) % 15746
    }
}

print(cache[n])

// 방법 2) 반복문
// 메모리: 76916 KB(방법 1) -> 69100 KB
let n = Int(readLine() ?? "") ?? 0
var result = 0

if n <= 3 {
    result = n
} else {
    var a = 1
    var b = 2
    for _ in 3...n {
        result = (a + b) % 15746
        a = b
        b = result
    }
}

print(result)
