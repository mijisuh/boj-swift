while let inputs = readLine(), inputs != "." {
    var stack: [Character] = []

    for input in inputs {
        switch input {
            case "(", "[":
                stack.append(input)
            case ")":
                if stack.last == "(" {
                    stack.popLast()
                } else { // ")", "[", "]"
                    stack.append(input)
                    break
                }
            case "]":
                if stack.last == "[" {
                    stack.popLast()
                } else { // "]", "(", ")"
                    stack.append(input)
                    break
                }
            default: break
        }
    }
    
    print(stack.count == 0 ? "yes" : "no")
}
