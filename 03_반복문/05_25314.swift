let input = Int(readLine()!)!
let nums = input / 4
var result = String(repeating: "long ", count: nums) + "int"
print(result)


/*

[특정 문자열을 지정한 개수만큼 추가]
String(repeating:count:) -> for 문 사용 X, swift 내장 함수 사용

*/