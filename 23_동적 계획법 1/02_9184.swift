// 방법 1) 바텀 업(memoization)
var cache = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 1, count: 21), count: 21), count: 21)

for i in 1...20 {
    for j in 1...20 {
        for k in 1...20 {
            if i < j, j < k {
                cache[i][j][k] = cache[i][j][k - 1] + cache[i][j - 1][k - 1] - cache[i][j - 1][k]
            } else {
                cache[i][j][k] = cache[i - 1][j][k] + cache[i - 1][j - 1][k] + cache[i - 1][j][k - 1] - cache[i - 1][j - 1][k - 1]
            }
        }
    }
}

while let input = readLine() {
    let inputs = input.split { $0 == " " }.map { Int($0) ?? 0 }
    let (a, b, c) = (inputs[0], inputs[1], inputs[2])
    if !(a == -1 && b == -1 && c == -1) {
        if a <= 0 || b <= 0 || c <= 0 {
            print("w(\(a), \(b), \(c)) = 1")
        } else if a > 20 || b > 20 || c > 20 {
            print("w(\(a), \(b), \(c)) = \(cache[20][20][20])")
        } else {
            print("w(\(a), \(b), \(c)) = \(cache[a][b][c])")
        }
    }
}

// 방법 2) 탑 다운(recursive + memoization)
var cache = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 1, count: 21), count: 21), count: 21)

for i in 1...20 {
    for j in 1...20 {
        for k in 1...20 {
            if i < j, j < k {
                cache[i][j][k] = cache[i][j][k - 1] + cache[i][j - 1][k - 1] - cache[i][j - 1][k]
            } else {
                cache[i][j][k] = cache[i - 1][j][k] + cache[i - 1][j - 1][k] + cache[i - 1][j][k - 1] - cache[i - 1][j - 1][k - 1]
            }
        }
    }
}

func recursive(_ a: Int, _ b: Int, _ c: Int) -> Int {
    if a <= 0 || b <= 0 || c <= 0 {
        return 1
    } else if a > 20 || b > 20 || c > 20 {
        return cache[20][20][20]
    } else if cache[a][b][c] != 1 { // 중요! 이미 값이 만들어졌으면 해당 값 반환(안해주면 시간 초과)
        return cache[a][b][c]
    } else if a < b, b < c {
        cache[a][b][c] = recursive(a, b, c - 1) + recursive(a, b - 1, c - 1) - recursive(a, b - 1, c)
        return cache[a][b][c]
    }
    cache[a][b][c] = recursive(a - 1, b, c) + recursive(a - 1, b - 1, c) + recursive(a - 1, b, c - 1) - recursive(a - 1, b - 1, c - 1)
    return cache[a][b][c]
}

while let input = readLine() {
    let inputs = input.split { $0 == " " }.map { Int($0) ?? 0 }
    let (a, b, c) = (inputs[0], inputs[1], inputs[2])
    if !(a == -1 && b == -1 && c == -1) {
        print("w(\(a), \(b), \(c)) = \(recursive(a, b, c))")
    }
}
