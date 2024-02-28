// 방법 1) F(n) = F(n - 2) + F(n - 3)
//    n: 1 2 3 4 5 6 7 8 9 10
// F(n): 1 1 1 2 2 3 4 5 7 9
let _ = Int(readLine() ?? "") ?? 0

var cache = [Int](repeating: 1, count: 101)
for i in 4...100 {
    cache[i] = cache[i - 2] + cache[i - 3]
}

while let n = Int(readLine() ?? "") {
    print(cache[n])
}

// 방법 2) F(n) = F(n - 5) + F(n - 1)
// [1 1 1 2 3]을 반복적으로 더함
//    n: 1 2 3 4 5 6 7 8 9 10
// F(n): 1 1 1 2 2 3 4 5 7 9
//               1 1 1 2 2 3
let _ = Int(readLine() ?? "") ?? 0

var cache = [Int](repeating: 1, count: 101)
cache[4] = 2
cache[5] = 2
for i in 6...100 {
    cache[i] = cache[i - 5] + cache[i - 1]
}

while let n = Int(readLine() ?? "") {
    print(cache[n])
}
