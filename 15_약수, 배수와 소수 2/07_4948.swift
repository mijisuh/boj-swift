var inputs: [Int] = []
while let n = Int(readLine() ?? ""), n != 0 {
    inputs.append(n)
}

let max = 2 * (inputs.max() ?? 0)
var primeArrays = Array(repeating: 1, count: 2 * max + 1)

for i in 2..<max {
    for j in stride(from: i * 2, through: max, by: i) {
        primeArrays[j] = 0
    }
}

for input in inputs {
    print(primeArrays[(input + 1)...(input * 2)].filter { $0 == 1 }.count)
}
