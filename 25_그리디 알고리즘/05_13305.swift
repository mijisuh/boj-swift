let n = Int(readLine() ?? "") ?? 0
let distances = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
var prices = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }

var total = 0
var minPrice = prices[0] // 현재까지 나온 최소 가격으로 계산
for i in 0..<(n - 1) {
    if prices[i] < minPrice {
        minPrice = prices[i]
    }
    total += minPrice * distances[i]
}

print(total)
