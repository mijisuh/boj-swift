let n = Int(readLine() ?? "") ?? 0
var input = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }

var stack: [Int] = []
var target = 1

for current in input {
    stack.append(current) // 일단 대기열에 넣음
    
    while !stack.isEmpty && stack.last == target { // 순서가 안맞을 때까지 대기열 pop
        stack.popLast()
        target += 1
    }
}

print(stack.count == 0 ? "Nice" : "Sad")
