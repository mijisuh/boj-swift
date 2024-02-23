// 방법 1) 덱 활용
// 그냥 계산하게 되면 이중 for문 사용으로 시간초과 → 덱 활용
// 스택은 입력한 값 그대로 나오기 때문에 큐만 생각하면 되고
// [입력 값][큐에 있는 값] 순서대로 덱에 넣고 m개 만큼 popRight 해주면 됨
struct Dequeue<T> {
    var right = Array<T>()
    var left = Array<T>()
    
    mutating func pushLeft(_ input: T) {
        left.append(input)
    }
    
    mutating func pushRight(_ input: T) {
        right.append(input)
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
let qstack = (readLine() ?? "").split { $0 == " "}.map { Int($0) ?? 0 }
var array = (readLine() ?? "").split { $0 == " "}.map { Int($0) ?? 0 }
let m = Int(readLine() ?? "") ?? 0
let inputs = (readLine() ?? "").split { $0 == " "}.map { Int($0) ?? 0 }

var deque = Dequeue<Int>()

for i in 0..<n {
    if qstack[i] == 0 {
        deque.pushRight(array[i])
    }
}

for i in 0..<m {
    deque.pushLeft(inputs[i])
    print(deque.popRight() ?? 0, terminator: " ")
}

// 방법 2) reversed() 활용해서 출력할 순서대로 배열 생성
let n = Int(readLine() ?? "") ?? 0
let qstack = (readLine() ?? "").split { $0 == " "}.map { Int($0) ?? 0 }
var array = (readLine() ?? "").split { $0 == " "}.map { Int($0) ?? 0 }
let m = Int(readLine() ?? "") ?? 0
var inputs = (readLine() ?? "").split { $0 == " "}.map { Int($0) ?? 0 }
var output: [Int] = [] // 출력할 순서대로 데이터 입력

for i in 0..<n {
    if qstack[i] == 0 {
        output.append(array[i])
    }
}

inputs = inputs.reversed() + output // Input -> [입력 값][큐에 있는 값] -> Output

for _ in 0..<m {
    print(inputs.popLast() ?? 0, terminator: " ")
}
