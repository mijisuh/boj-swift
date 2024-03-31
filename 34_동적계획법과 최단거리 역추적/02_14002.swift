let n = Int(readLine() ?? "") ?? 0
let array = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }

var dp = [Int](repeating: 1, count: n)

for i in 1..<n {
    for j in 0..<i {
        if array[j] < array[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

var count = dp.max() ?? 0
print(count)

var result: [Int] = []
// 인덱스 역추적
for i in (0..<n).reversed() { // dp 역순으로
    if dp[i] == count { // 내림차순으로
        result.append(array[i]) // 해당하는 값 저장
        count -= 1 // 중복없이
    }
}
print(result.reversed().map { String($0) }.joined(separator: " "))
