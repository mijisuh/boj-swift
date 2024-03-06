let nb = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0}
let (n, b) = (nb[0], nb[1])
let mod = 1_000
let matrix = (0..<n).map { _ in
    (readLine() ?? "").split { $0 == " " }.map { (Int($0) ?? 0) % mod }
}

func multiply(_ a: [[Int]], _ b: [[Int]]) -> [[Int]] {
    var result = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    for x in 0..<n {
        for y in 0..<n {
            for z in 0..<n {
                result[x][y] += a[x][z] * b[z][y]
            }
            result[x][y] %= mod
        }
    }
    return result
}

func pow(_ a: [[Int]], _ n: Int) -> [[Int]] { // 분할 정복
    if n == 1 { return a }

    let half = pow(a, n / 2)
    let squaredHalf = multiply(half, half)
    if n % 2 == 0 {
        return squaredHalf
    } else {
        return multiply(a, squaredHalf)
    }
}

let result = pow(matrix, b)
result.forEach {
    $0.forEach {
        print($0, terminator: " ")
    }
    print()
}
