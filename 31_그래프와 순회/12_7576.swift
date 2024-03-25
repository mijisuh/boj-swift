let mn = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (m, n) = (mn[0], mn[1])
var map = (0..<n).map { _ in
    (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
}

var queue: [(x: Int, y: Int)] = []
for i in 0..<n {
    for j in 0..<m {
        if map[i][j] == 1 {
            queue.append((j, i))
        }
    }
}

let dy = [1, -1, 0, 0]
let dx = [0, 0, 1, -1]

var index = 0

while queue.count > index {
    let (x, y) = queue[index]

    for i in 0..<4 {
        let (nx, ny) = (x + dx[i], y + dy[i])
        if (0..<m) ~= nx, (0..<n) ~= ny, map[ny][nx] == 0, map[ny][nx] != -1 {
            map[ny][nx] = map[y][x] + 1
            queue.append((nx, ny))
        }
    }
    index += 1
}

let flat = map.flatMap { $0 }

print(flat.contains(0) ? -1 : flat.max()! - 1)
