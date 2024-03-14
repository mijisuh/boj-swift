// 이중 반복문 -> 시간 초과
// 스택 활용
let n = Int(readLine() ?? "") ?? 0
let s = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
var answer = [Int](repeating: -1, count: n)
var stack: [Int] = [] // 이전 수에 대한 인덱스(오큰수의 후보)

for i in 0..<n {
    while let stackLast = stack.last, s[stackLast] < s[i] { // 이전 수 < 현재 수 라면
        answer[stackLast] = s[i] // 이전 수의 위치에 현재 수 넣기
        stack.removeLast() // 현재 위치보다 큰 수의 인덱스만 남음
    }
    stack.append(i)
}

print(answer.map { String($0) }.joined(separator: " "))
