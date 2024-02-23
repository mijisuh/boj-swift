let n = Int(readLine() ?? "") ?? 0
var stack: [Int] = []
while let input = Int(readLine() ?? "") {
    if input == 0 {
        stack.popLast()
    } else {
        stack.append(input)
    }
}
print(stack.reduce(0, +))


/*

 - removeLast():  배열이 비어 있는 경우, 런타임 오류 발생
 - popLast(): 배열이 비어 있는 경우, 반환 값이 옵셔널이기 때문에 런타임 오류가 발생하지 않고 nil 반환
 
*/
