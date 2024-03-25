let nm = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (n, m) = (nm[0], nm[1])
var map = (0..<n).map { _ in
    (readLine() ?? "").map { Int(String($0)) ?? 0 }
}

let dy = [1, -1, 0, 0]
let dx = [0, 0, 1, -1]

// 내부에는 [안 부쉈을 때 개수, 부쉈을 때 개수]
var visited = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: m), count: n)
visited[0][0][0] = 1

var queue: [(x: Int, y: Int, crash: Int)] = [(0, 0, 0)]
var index = 0

var result = -1

while queue.count > index {
    let (x, y, crash) = queue[index]

    if y == n - 1, x == m - 1 {
        result = visited[y][x][crash]
        break
    }

    for i in 0..<4 {
        let (nx, ny) = (x + dx[i], y + dy[i])

        if (0..<n) ~= ny, (0..<m) ~= nx, visited[ny][nx][crash] == 0 {
            if map[ny][nx] == 0 { // 안 부수고 방문 가능
                visited[ny][nx][crash] = visited[y][x][crash] + 1
                queue.append((nx, ny, crash))
            } else if crash == 0 { // 부수고 방문 가능
                visited[ny][nx][1] = visited[y][x][crash] + 1
                queue.append((nx, ny, 1))
            }
        }
    }

    index += 1
}

print(result)
