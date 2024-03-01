let n = Int(readLine() ?? "") ?? 0
var array: [(from: Int, to: Int)] = []
var dp = [Int](repeating: 1, count: n)

while let input = readLine() {
    let inputs = input.split { $0 == " " }.map { Int($0) ?? 0 }
    array.append((from: inputs[0], to: inputs[1]))
}

array.sort { $0.from < $1.from } // 1) 먼저 A 전봇대 오름차순 정렬

for i in 0..<n {
    for j in 0..<i {
        if array[j].to < array[i].to { // 2) B 전봇대 기준으로 가장 긴 증가하는 부분 수열의 길이 계산
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(n - (dp.max() ?? 0)) // B 전봇대의 가장 긴 증가하는 부분 수열을 제외한 원소의 개수
