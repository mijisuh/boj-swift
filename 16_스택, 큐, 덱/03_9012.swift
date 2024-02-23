let n = readLine()
while let inputs = readLine() {
    var stack: [Character] = []
    
    for input in inputs {
        if input == "(" {
            stack.append(input)
        } else {
            if let last = stack.last {
                if input == last {
                    stack.append(input)
                } else {
                    stack.popLast()
                }
            } else { //사실 이렇게 되면 절대로 ()이 될 수 없기 때문에 바로 "NO" 출력해도 됨
                stack.append(input)
            }
        }
    }
    
    print(stack.count == 0 ? "YES" : "NO")
}
