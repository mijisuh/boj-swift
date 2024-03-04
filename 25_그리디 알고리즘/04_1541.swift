// 방법 1)
let input = (readLine() ?? "")
let operands = input.split { $0 == "+" || $0 == "-" }.map { Int($0) ?? 0 }
var operators: [Character] = []

for ch in input {
    if ch == "+" || ch == "-" {
        operators.append(ch)
    }
}

var tmp = operands[0]
var tmpArray: [Int] = []

for i in 0..<operands.count - 1 {
    if operators[i] == "+" {
        tmp += operands[i + 1]
    } else {
        tmpArray.append(tmp)
        tmp = operands[i + 1]
    }
}
tmpArray.append(tmp)

print(tmpArray.reduce(tmpArray[0] * 2, -))

// 방법 2) 효율적인 코드
let input = (readLine() ?? "").split { $0 == "-" }

var sum = input[0].split { $0 == "+" }.map { Int($0) ?? 0 }.reduce(0, +) // 처음 나온 - 이전 값은 모두 더하고

for i in 1..<input.count {
    sum -= input[i].split { $0 == "+" }.map { Int($0) ?? 0 }.reduce(0, +) // 그 이후에 나온 값들은 다 빼줌
}

print(sum)
