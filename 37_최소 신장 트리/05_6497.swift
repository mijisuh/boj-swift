// 빠른 입출력 사용 안하면 시간 초과
// 방법 1: 전체 비용 - 최소 비용
import Foundation

typealias Edge = (x: Int, y: Int, z: Int)

func find(_ x: Int, _ parent: inout [Int]) -> Int {
    if parent[x] == x { return x }
    parent[x] = find(parent[x], &parent)
    return parent[x]
}

func merge(_ x: Int, _ y: Int, _ parent: inout [Int]) {
    let parentX = find(x, &parent)
    let parentY = find(y, &parent)

    if parentX < parentY {
        parent[parentY] = parentX
    } else if parentY < parentX {
        parent[parentX] = parentY
    }
}

func isCycle(_ x: Int, _ y: Int, _ parent: inout [Int]) -> Bool {
    return find(x, &parent) == find(y, &parent)
}

func kruskal(_ m: Int, _ edges: inout [Edge]) -> Int {
    var parent = [Int](0...m)
    var minCost = 0

    edges.sort { $0.z < $1.z }

    for (x, y, z) in edges where !isCycle(x, y, &parent) {
        merge(x, y, &parent)
        minCost += z
    }

    return minCost
}

let file = FileIO()

while true {
    let (m, n) = (file.readInt(), file.readInt())

    if m == 0, n == 0 { break }

    var totalCost = 0
    var edges: [Edge] = []
    for _ in 0..<n {
        let (x, y, z) = (file.readInt(), file.readInt(), file.readInt())
        edges.append((x, y, z))
        totalCost += z
    }

    print(totalCost - kruskal(m, &edges)) // 전체 비용 - 최소 비용
}

// 라이노님의 FileIO
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

// 방법 2: 최소비용이 아닌 경로의 비용
import Foundation

typealias Edge = (x: Int, y: Int, z: Int)

func find(_ x: Int, _ parent: inout [Int]) -> Int {
    if parent[x] == x { return x }
    parent[x] = find(parent[x], &parent)
    return parent[x]
}

func merge(_ x: Int, _ y: Int, _ parent: inout [Int]) {
    let parentX = find(x, &parent)
    let parentY = find(y, &parent)

    if parentX < parentY {
        parent[parentY] = parentX
    } else if parentY < parentX {
        parent[parentX] = parentY
    }
}

func isCycle(_ x: Int, _ y: Int, _ parent: inout [Int]) -> Bool {
    return find(x, &parent) == find(y, &parent)
}

func kruskal(_ m: Int, _ edges: inout [Edge]) -> Int {
    var parent = [Int](0...m)
    var answer = 0

    edges.sort { $0.z < $1.z }

    for (x, y, z) in edges {
        if isCycle(x, y, &parent) {
            answer += z // 최소비용의 경로로 가지 않는 경우
        } else {
            merge(x, y, &parent)
        }
    }

    return answer
}

let file = FileIO()

while true {
    let (m, n) = (file.readInt(), file.readInt())

    if m == 0, n == 0 { break }

    var totalCost = 0
    var edges: [Edge] = []
    for _ in 0..<n {
        let (x, y, z) = (file.readInt(), file.readInt(), file.readInt())
        edges.append((x, y, z))
        totalCost += z
    }

    print(kruskal(m, &edges))
}

// 라이노님의 FileIO
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}
