let n = Int(readLine() ?? "") ?? 0
let array = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let reversed = Array(array.reversed())
var dp1 = [Int](repeating: 1, count: n) // 가장 긴 증가하는 부분 수열의 길이
var dp2 = [Int](repeating: 1, count: n) // 가장 긴 감소하는 부분 수열의 길이

for i in 0..<n {
    for j in 0..<i {
        if array[j] < array[i] {
            dp1[i] = max(dp1[i], dp1[j] + 1)
        }
    }
}

for i in 0..<n {
    for j in 0..<i {
        if reversed[j] < reversed[i] {
            dp2[i] = max(dp2[i], dp2[j] + 1)
        }
    }
}

var result = 0
for i in 0..<n {
    let count = dp1[i] + dp2[n - i - 1] - 1 // 증가 수열 + 감소 수열 - 1(겹치는 원소)
    result = max(result, count)
}

print(result)
