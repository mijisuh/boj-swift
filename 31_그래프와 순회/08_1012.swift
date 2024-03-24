var dy = [1, -1, 0, 0]
var dx = [0, 0, 1, -1]

func isValid(_ y: Int, _ x: Int, _ n: Int, _ m: Int) -> Bool {
    return (0..<n) ~= y && (0..<m) ~= x
}

func dfs(_ y: Int, _ x: Int, _ map: inout [[Int]], _ n: Int, _ m: Int) {
    map[y][x] = 0

    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]

        if isValid(ny, nx, n, m), map[ny][nx] == 1 {
            dfs(ny, nx, &map, n, m)
        }
    }
}

let _ = readLine()

while let input = readLine() {
    let MNK = input.split { $0 == " " }.map { Int($0) ?? 0 }
    let (M, N, K) = (MNK[0], MNK[1], MNK[2])

    var map = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
    for _ in 0..<K {
        let XY = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
        let (X, Y) = (XY[0], XY[1])
        map[Y][X] = 1
    }

    var count = 0
    
    for y in 0..<N {
        for x in 0..<M {
            if map[y][x] == 1 {
                count += 1
                dfs(y, x, &map, N, M)
            }
        }
    }

    print(count)
}
