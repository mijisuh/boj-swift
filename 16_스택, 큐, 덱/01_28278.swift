let n = Int(readLine() ?? "") ?? 0
var stack: [Int] = []
while let input = readLine() {
    let inputArray = input.split { $0 == " " }.map { Int($0) ?? 0 }
    switch inputArray[0] {
        case 1:
            stack.append(inputArray[1])
        case 2:
            print(stack.popLast() ?? -1) // 배열의 마지막 요소를 삭제하고 해당 요소 반환
        case 3:
            print(stack.count)
        case 4:
            print(stack.isEmpty ? 1 : 0)
        case 5:
            print(stack.last ?? -1)
        default:
            break
    }
}
