// 방법 1) 각 자릿수를 직접 계산
let a = Int(readLine()!)!
let b = Int(readLine()!)!

let b1 = b / 100
let b2 = (b - (b1 * 100)) / 10
let b3 = (b - (b1 * 100)) - (b2 * 10)

print(a * b3)
print(a * b2)
print(a * b1)
print(a * ((b1 * 100) + (b2 * 10) + (b3)))


// 방법 2) 입력을 [Int] 타입으로 받으면 각 인덱스로 각 자릿수 접근 가능
let a = Int(readLine()!)!
let bInputs = Array(readLine()!) // Array() -> 'String.Element' (aka 'Character')
let b = bInputs.map { Int(String($0))! } // String 형 변환 필수!

let b1 = b[0]
let b2 = b[1]
let b3 = b[2]

print(a * b3)
print(a * b2)
print(a * b1)
print(a * ((b1 * 100) + (b2 * 10) + (b3)))