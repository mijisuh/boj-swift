struct Dequeue<T> {
    var right = Array<T>() // right
    var left = Array<T>() // left
    
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

let n = Int(readLine() ?? "") ?? 0
var inputs = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
var dequeue = Dequeue<(Int, Int)>()
var pointer = 0
var ballon: (Int, Int) = (0, 0) // 현재 터트린 풍선
var result: [Int] = []

for (index, value) in inputs.enumerated() {
    dequeue.pushRight((index + 1, value)) // (인덱스, 값) 형태의 튜플
}

// 처음 풍선은 그냥 터트림
ballon = dequeue.popLeft() ?? (0, 0)
pointer = ballon.1
result.append(ballon.0)

while result.count < n {
    for i in 0..<abs(pointer) {
                if pointer < 0 { // 방향: Right -> Left
            dequeue.pushLeft(dequeue.last!)
            dequeue.popRight()
        } else { // 방향: Left -> Right
            dequeue.pushRight(dequeue.first!)
            dequeue.popLeft()
        }
    }
    
    ballon = (pointer < 0 ? dequeue.popLeft() : dequeue.popRight()) ?? (0, 0)
    pointer = ballon.1
    result.append(ballon.0)
}

print(result.map { String($0) }.joined(separator: " "))


/*

 ** 원, 회전 구조의 자료 구조를 정의하고 싶으면 덱을 사용해보자!
 - 이동하는 방향이 양수면: 현재의 Left에 있는 것들을 현재의 Right 쪽으로 이동
 - 이동하는 방향이 음수면: Right → Left
 
*/
