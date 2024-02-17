var result = ""

while true {
    var inputs = readLine()!.split(separator: " ").map { Int($0)! }
    if inputs[0] == 0 && inputs[1] == 0 {
        break
    }
    result += "\(inputs[0] + inputs[1])\n"
}

print(result)