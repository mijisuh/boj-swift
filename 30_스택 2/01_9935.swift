let s = Array(readLine() ?? "")
let find = Array(readLine() ?? "")
var stack: [Character] = []

s.forEach {
    stack.append($0)
    if $0 == find.last { // 현재 문자가 폭탄 문자열의 마지막 문자랑 같은 경우
        if stack.count >= find.count {
                // stack의 맨 뒤에서부터 폭탄 문자열의 길이만큼 확인해서 폭탄 문자열인 경우를 확인
                // 방법 1) ArraySlice
            // if Array(stack[(stack.count - find.count)..<stack.count]) == find {
            //     for _ in 0..<find.count {
            //         stack.removeLast()
            //     }
            // }
            // 방법 2) for문
            var isBomb = true
            for i in 0..<find.count {
                if stack[stack.count - 1 - i] != find[find.count - 1 - i] {
                    isBomb = false
                }
            }
            if isBomb {
                for _ in 0..<find.count {
                    stack.removeLast()
                }
            }
        }
    }
}

print(stack.isEmpty ? "FRULA" : String(stack))
