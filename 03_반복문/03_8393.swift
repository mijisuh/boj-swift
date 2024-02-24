// MARK: 방법 1
let input = Int(readLine()!)!
var result = 0

for i in 1...input {
    result += i
}

print(result)

// MARK: 방법 2) 가우스의 덧셈 활용
let input = Int(readLine()!)!
let result = (input + 1) * input / 2
print(result)
