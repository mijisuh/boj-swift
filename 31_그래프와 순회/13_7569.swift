let mnh = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (m, n, h) = (mnh[0], mnh[1], mnh[2])
var map: [[[Int]]] = (0..<h).map { _ in
    (0..<n).map { _ in
        (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
    }
}

var queue: [(x: Int, y: Int, z: Int)] = []
for i in 0..<h {
    for j in 0..<n {
        for k in 0..<m {
            if map[i][j][k] == 1 {
                queue.append((k, j, i))
            }
        }
    }
}

let dz = [1, -1, 0, 0, 0, 0]
let dy = [0, 0, 1, -1, 0, 0]
let dx = [0, 0, 0, 0, 1, -1]

var index = 0

while queue.count > index {
    let (x, y, z) = queue[index]

    for i in 0..<6 {
        let (nx, ny, nz) = (x + dx[i], y + dy[i], z + dz[i])
        if (0..<m) ~= nx, (0..<n) ~= ny, (0..<h) ~= nz, map[nz][ny][nx] == 0, map[nz][ny][nx] != -1 {
            map[nz][ny][nx] = map[z][y][x] + 1
            queue.append((nx, ny, nz))
        }
    }
    index += 1
}

let flat = map.flatMap { $0 }.flatMap { $0 }
print(flat.contains(0) ? -1 : flat.max()! - 1)
