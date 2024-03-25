let nm = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (n, m) = (nm[0], nm[1])

var up: [Int: Int] = [:]
for _ in 0..<n {
    let input = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
    up[input[0]] = input[1]
}

var down: [Int: Int] = [:]
for _ in 0..<m {
    let input = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
    down[input[0]] = input[1]
}

let dx = [1, 2, 3, 4, 5, 6]

var visited = [Int](repeating: 0, count: 101)
var queue = [1]
var index = 0

while queue.count > index {
    let x = queue[index]

    for i in 0..<dx.count {
        var nx = x + dx[i]
        nx = up[nx] ?? down[nx] ?? nx
        if (0...100) ~= nx, visited[nx] == 0 {
            visited[nx] = visited[x] + 1
            queue.append(nx)
        }
    }
    index += 1
}

print(visited[100])
