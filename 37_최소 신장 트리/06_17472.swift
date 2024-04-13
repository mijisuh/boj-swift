typealias Point = (x: Int, y: Int)
typealias Edge = (u: Int, v: Int, dist: Int)

func isValidCoord(_ point: Point) -> Bool {
    return 0..<m ~= point.x && 0..<n ~= point.y
}

func setNumber(_ start: Point, _ number: Int) {
    var queue = [start]
    var index = 0

    map[start.y][start.x] = number
    visited[start.y][start.x] = true

    while index < queue.count {
        let current = queue[index]
        index += 1

        for i in 0..<4 {
            let next = Point(current.x + dx[i], current.y + dy[i])

            if isValidCoord(next), !visited[next.y][next.x], map[next.y][next.x] == 1 {
                visited[next.y][next.x] = true
                map[next.y][next.x] = number
                queue.append(next)
            }
        }
    }
}

// 현재 좌표에서 상하좌우 확인 후, 바다인 방향 인덱스 리턴
// 0, 1, 2, 3 (상, 하, 좌, 우)
func getBridgeDirections(_ point: Point) -> [Int] {
    var directions: [Int] = []
    for i in 0..<4 {
        let next = Point(point.x + dx[i], point.y + dy[i])
        if !isValidCoord(next) { continue }
        if map[next.y][next.x] == 0 {
            directions.append(i)
        }
    }
    return directions
}

// 해당 좌표에서 다리 놓기
// - Parameters:
//   - point: 출발 섬의 좌표 정보
//   - number: 출발 섬 번호
//   - direction: 다리를 놓는 방향
//   - dist: 다리의 길이
func makeBridge(_ point: Point, _ number: Int, _ direction: Int, _ dist: Int) {
    var queue = [(point, direction, dist)]
    var index = 0
    
    while index < queue.count {
        let current = queue[index].0
        let direction = queue[index].1
        let dist = queue[index].2
        
        if map[current.y][current.x] == number && dist > 1 { break }
        
        if map[current.y][current.x] > 0 && map[current.y][current.x] != number {
            if dist > 2 {
                edges.append((number, map[current.y][current.x], dist - 1))
            }
            break
        }
        
        let next = Point(current.x + dx[direction], current.y + dy[direction])
        
        if !isValidCoord(next) { break }
        
        queue.append((next, direction, dist + 1))
        index += 1
    }
}

func find(_ u: Int) -> Int {
    if parent[u] == u { return u }
    parent[u] = find(parent[u])
    return parent[u]
}

func merge(_ u: Int, _ v: Int) {
    let parentU = find(u)
    let parentV = find(v)

    if parentU < parentV {
        parent[parentV] = parentU
    } else if parentV < parentU {
        parent[parentU] = parentV
    }
}

func isCycle(_ u: Int, _ v: Int) -> Bool {
    return find(u) == find(v)
}

func kruskal() -> Int {
    var answer = 0
    var edgesCount = 0
    
    edges.sort { $0.dist < $1.dist }

    for (u, v, dist) in edges where !isCycle(u, v) {
        merge(u, v)
        answer += dist
        edgesCount += 1
    }

    return edgesCount != number - 1 ? -1 : answer
}

let nm = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (n, m) = (nm[0], nm[1])

var map = [[Int]](repeating: [], count: n)

for i in 0..<n {
    let input = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
    map[i] = input
}

// 1. 섬에 번호 부여
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
var number = 0
let dx = [0, 0, -1, 1]
let dy = [1, -1, 0, 0]

for y in 0..<n {
    for x in 0..<m {
        if !visited[y][x], map[y][x] == 1 {
            number += 1
            setNumber(Point(x, y), number)
        }
    }
}

// 2. 섬 사이에 놓일 수 있는 다리(간선) 구하기
var edges: [Edge] = []

for y in 0..<n {
    for x in 0..<m {
        if map[y][x] > 0 {
            let point = Point(x, y)
            // 바다와 인접한 방향
            let direction = getBridgeDirections(point)
            direction.forEach {
                makeBridge(point, map[y][x], $0, 0)
            }
        }
    }
}

// 3. 최단 거리 간선의 합 구하기
var parent = [Int](0...number)

print(kruskal())
