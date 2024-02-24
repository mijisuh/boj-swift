let n = Int(readLine() ?? "") ?? 0
var dances: Set<String> = ["ChongChong"]

while let input = readLine() {
    let inputs = input.split { $0 == " " }.map { String($0) }
    if dances.contains(inputs[0]) || dances.contains(inputs[1]) {
        dances.insert(inputs[0])
        dances.insert(inputs[1])
    }
        // inputs[0]이 dances에 포함된 경우 inputs[1]을 dances에 넣고
        // inputs[1]이 dances에 포함된 경우 inputs[0]을 dances에 넣는 것이 맞지만
        // 중복을 허용하지 않는 Set의 특성을 활용
}

print(dances.count)
