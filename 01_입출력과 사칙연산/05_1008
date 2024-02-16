let inputs = readLine()!.split(separator: " ").map { Double($0)! }
let result = inputs[0] / inputs[1]
print(result)


/*

[Swift에서 입력 받기]

1. Line 단위로 읽기 + 공백(Space)으로 구분되어 있는 입력
- let nums = readLine()!.split(seperator: " ") → String.SubSequence 타입(map()으로 커버 가능)
- let nums = readLine()!.components(seperatedBy: " ") -> String 타입(import Foundation 필수)

2. Int 값을 바로 입력
- let n: Int = Int(readLine()!)!

3. [String] → [Int]
- let nums: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
- String.SubSequence → Int의 형 변환 보다 String.SubSequence → String → Int의 형 변환이 더 빠름 (*입력에서 시간 초과 나면 사용)

*/