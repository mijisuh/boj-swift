import Foundation

final class FileIO {
    private let buffer: [UInt8]
    private var index: Int = 0

    init(fileHandler: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandler.readToEnd()! + [UInt8(0)])
    }
    
    @inline(__always)
    private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer[index]
    }
    
    @inline(__always)
    func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10 || now == 32 { now = read() }
        
        if now == 45 {
            isPositive.toggle()
            now = read()
        }
        
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now - 48)
            now = read()
        }
        
        return sum * (isPositive ? 1 : -1)
    }
    
    @inline(__always) func readString() -> String {
        var now = read()
        
        while now == 10 || now == 32 { now = read() }
        
        let beginIndex = index - 1
        
        while now != 10, now != 32, now != 0 { now = read() }
        
        return String(bytes: Array(buffer[beginIndex..<(index - 1)]), encoding: .ascii)!
    }
    
    @inline(__always)
    func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()
        
        while now == 10 || now == 32 { now = read() }
        let beginIndex = index - 1
        
        while now != 10, now != 32, now != 0 { now = read() }
        
        return Array(buffer[beginIndex..<(index - 1)])
    }
}

struct Dequeue<T> {
    var right = Array<T>()
    var left = Array<T>()
    
    var count: Int {
        return right.count + left.count
    }
    
    var isEmpty: Int {
        return right.isEmpty && left.isEmpty ? 1 : 0
    }
    
    var first: T? {
        return left.last ?? right.first
    }
    
    var last: T? {
        return right.last ?? left.first
    }
    
    mutating func pushLeft(_ input: T) {
        left.append(input)
    }
    
    mutating func pushRight(_ input: T) {
        right.append(input)
    }
    
    mutating func popLeft() -> T? {
        if left.isEmpty {
            left = right.reversed()
            right = []
        }
        
        return left.popLast() // first
    }
    
    mutating func popRight() -> T? {
        if right.isEmpty {
            right = left.reversed()
            left = []
        }
        
        return right.popLast() // last
    }
}

let fileIO = FileIO()
let n = fileIO.readInt()
var dequeue = Dequeue<Int>()

for _ in 0..<n {
    let command = fileIO.readInt()
    switch command {
        case 1:
            let num = fileIO.readInt()
            dequeue.pushLeft(num)
        case 2:
            let num = fileIO.readInt()
            dequeue.pushRight(num)
        case 3:
            print(dequeue.popLeft() ?? -1)
        case 4:
            print(dequeue.popRight() ?? -1)
        case 5:
            print(dequeue.count)
        case 6:
            print(dequeue.isEmpty)
        case 7:
            print(dequeue.first ?? -1)
        case 8:
            print(dequeue.last ?? -1)
        default: break
    }
}


/*

 [Dequeue]
 -> Queue의 특성과 Stack의 특성을 모두 갖는 자료구조
    - 양방향에서 삽입, 삭제가 가능
    - 삽입, 삭제: O(1)
 
*/
