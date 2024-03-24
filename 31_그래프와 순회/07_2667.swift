let N = Int(readLine() ?? "") ?? 0
var map = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
for i in 0..<N {
    map[i] = (readLine() ?? "").map { Int(String($0)) ?? 0 }
}

let dx = [0, 0, -1, 1] // 상, 하, 좌, 우
let dy = [1, -1, 0, 0]
var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)

func isValid(_ y: Int, _ x: Int) -> Bool {
    return (0..<N) ~= y && (0..<N) ~= x
}

func dfs(_ y: Int, _ x: Int) -> Int {
    visited[y][x] = true
    var count = 1

    for i in 0..<4 {
        if isValid(y + dy[i], x + dx[i]),
            !visited[y + dy[i]][x + dx[i]],
            map[y + dy[i]][x + dx[i]] == 1 {
            count += dfs(y + dy[i], x + dx[i])
        }
    }

    return count
}

var counts: [Int] = []

for y in 0..<N {
    for x in 0..<N {
        if !visited[y][x], map[y][x] == 1 {
            counts.append(dfs(y, x))
        }
    }
}

print(counts.count)
counts.sorted().forEach { print($0) }
