// 방법 1) 큐 활용
let inputs = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let n = inputs[0], k = inputs[1]
var queue = Array(1...n)
var pointer = 0
var result: [Int] = []

while result.count < n {
    if (pointer + 1) % k == 0 {
        result.append(queue[pointer])
    } else {
        queue.append(queue[pointer])
    }
    pointer += 1
}

print("<\(result.map { String($0) }.joined(separator: ", "))>")

// 방법 2) index로 순회
let inputs = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let n = inputs[0], k = inputs[1]
var queue = Array(1...n)
var pointer = 0
var result: [Int] = []

while result.count < n {
    let index = (pointer + k - 1) % queue.count // 전체 배열의 크기로 나눠 범위 재설정
    result.append(queue.remove(at: index))
    pointer = index
}

print("<\(result.map { String($0) }.joined(separator: ", "))>")
