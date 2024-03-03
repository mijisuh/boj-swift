let nm = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (n, m) = (nm[0], nm[1])

let array = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }

var indices: [(from: Int, to: Int)] = []
while let input = readLine() {
    let inputs = input.split { $0 == " " }.map { Int($0) ?? 0 }
    indices.append((from: inputs[0], to: inputs[1]))
}

var presum = [0] + array

for i in 1...n {
    presum[i] += presum[i - 1]
}

indices.forEach {
    print(presum[$0.to] - presum[$0.from - 1]) // 중복 구간 빼기
}
