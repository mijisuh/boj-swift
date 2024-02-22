let n = readLine() ?? ""
var inputs: [Int] = []
while let n = Int(readLine() ?? ""), n != 0 {
    inputs.append(n)
}

let max = inputs.max() ?? 0
var primeArrays = Array(repeating: 1, count: max + 1)
primeArrays[0] = 0
primeArrays[1] = 0

for i in 2..<max {
    for j in stride(from: i * 2, through: max, by: i) {
        primeArrays[j] = 0
    }
}

for input in inputs {
    var count = 0
    for i in 2...(input / 2) {
                // 합이 n이 되는 경우의 수를 일일히 구하려고 하면 시간 초과
                // i + (input - i) = input 이라는 것을 활용
        if primeArrays[i] == 1, primeArrays[input - i] == 1 {
            count += 1
        }
    }
    print(count)
}
