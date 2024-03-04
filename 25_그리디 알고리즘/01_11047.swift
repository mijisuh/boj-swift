let nk = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
var (n, k) = (nk[0], nk[1])
var coins: [Int] = []

while let input = readLine() {
    coins.append(Int(input) ?? 0)
}

var result = 0
while k > 0 {
    let last = coins.popLast() ?? 1 // 큰 단위부터 고려
    let count = k / last
    k -= last * count // k %= last
    result += count
}

print(result)
