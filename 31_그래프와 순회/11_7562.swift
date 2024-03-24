let dy = [-2, -1, -2, -1, 2, 1, 2, 1]
let dx = [-1, -2, 1, 2, -1, -2, 1, 2]

let t = Int(readLine() ?? "") ?? 0
for _ in 0..<t {
    let i = Int(readLine() ?? "") ?? 0
    let start = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
    let dest = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }

    var visited = [[Int]](repeating: [Int](repeating: 0, count: i), count: i)
    var queue = [start]
    var index = 0
    visited[start[1]][start[0]] = 1
    
    while queue.count > index, visited[dest[1]][dest[0]] == 0 { // dest 도착 여부 확인하면 시간 단축(168ms -> 96ms)
        let (x, y) = (queue[index][0], queue[index][1])

        for idx in 0..<8 {
            let (nx, ny) = (x + dx[idx], y + dy[idx])

            if (0..<i) ~= nx, (0..<i) ~= ny, visited[ny][nx] == 0 {
                visited[ny][nx] = visited[y][x] + 1
                queue.append([nx, ny])
            }
        }
        
        index += 1
    }

    print(visited[dest[1]][dest[0]] - 1)
}
