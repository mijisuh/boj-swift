let n = Int(readLine() ?? "") ?? 0
let array = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
var dp = [Int](repeating: 1, coun: n) // array[i]을 마지막 값으로 가지는 가장 긴 부분 수열의 길이

for i in 1..<n {
    for j in 0..<i { // 이전 값 탐색
        if array[j] < array[i] { // 이전 값들 < 현재 값
            dp[i] = max(dp[i], dp[j] + 1) // 이전 값들 중 가장 큰 값 + 1
        }
    }
}

print(dp.max() ?? 1)
