// 최소의 이동이기 때문에 BFS
let nm = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (n, m) = (nm[0], nm[1])
var map: [[Int]] = (0..<n).map { _ in
    (readLine() ?? "").map { Int(String($0)) ?? 0 }
}

let dy = [1, -1, 0, 0]
let dx = [0, 0, 1, -1]

func isValid(_ y: Int, _ x: Int) -> Bool {
    return (0..<n) ~= y && (0..<m) ~= x
}

func bfs(_ y: Int, _ x: Int, _ count: Int) {
    var queue: [(y: Int, x: Int)] = [(y, x)]
    var index = 0
    
    while queue.count > index {
        for i in 0..<4 {
            let (y, x) = (queue[index].y, queue[index].x)
            let (ny, nx) = (y + dy[i], x + dx[i])
            
            if isValid(ny, nx), map[ny][nx] == 1 {
                map[ny][nx] = map[y][x] + 1 // nx, ny로 이동하기 전의 위치에 있는 값에 1을 더해서 삽입(누적)
                // 이렇게 하면 이미 방문한 좌표는 1이 아니기 때문에 재방문하지 않음
                queue.append((ny, nx))
            }
        }
        index += 1
    }
}

bfs(0, 0, 0)
print(map[n - 1][m - 1])
