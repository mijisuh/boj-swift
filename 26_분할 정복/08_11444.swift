let mod = 1_000_000_007
let n = (Int(readLine() ?? "") ?? 0)
let fiboMatrix = [[1, 1], // (n = 2, n = 1)
                  [1, 0]] // (n = 1, n = 0)

func multiply(_ a: [[Int]], _ b: [[Int]], _ n: Int) -> [[Int]] {
    var result = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    for i in 0..<n {
        for j in 0..<n {
            for k in 0..<n {
                result[i][j] += a[i][k] * b[k][j]
            }
            result[i][j] %= mod
        }
    }
    return result
}

func pow(_ matrix: [[Int]], _ n: Int) -> [[Int]] {
    if n <= 1 { return matrix }

    let half = pow(matrix, n / 2)
    let squardHalf = multiply(half, half, 2)
    if n % 2 == 0 {
        return squardHalf
    } else {
        return multiply(matrix, squardHalf, 2)
    }
}

print(pow(fiboMatrix, n + 1)[1][1])

