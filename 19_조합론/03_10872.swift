let n = Int(readLine() ?? "") ?? 0
print((1...max(n, 1)).reduce(1) { $0 * $1 }) // n = 0 이면 1이 출력되도록 max로 보정
