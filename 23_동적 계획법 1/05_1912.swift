let n = Int(readLine() ?? "") ?? 0
let inputs = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }

var sum = inputs[0], maxSum = inputs[0]
for i in 1..<n {
    if inputs[i] < sum + inputs[i] { // 현재 값 < (누적합 + 현재 값) -> 누적합 += 현재 값
        sum += inputs[i]
    } else {
        sum = inputs[i] // 현재 값이 더 크면 누적합을 현재 값으로 업데이트
    }
    maxSum = max(sum, maxSum) // 현재 값 < (누적합 + 현재 값)
}

print(maxSum)
