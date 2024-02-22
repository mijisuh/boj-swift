// 방법 1) for 문으로 부분 문자열 구함
let s = readLine() ?? ""
let array = s.map { String($0) }
var setArray: Set<String> = [] // Set(모든 경우의 수)

for i in 0..<s.count {
    var subString: String = ""
    for j in i..<s.count {
        subString += array[j]
        setArray.insert(subString)
    }
}

print(setArray.count)

// 방법 2) Substring 타입 이용
let s = readLine() ?? ""
var setArray: Set<Substring> = []

for i in s.indices {
    for j in s.indices[i...] {
        setArray.insert(s[i...j])
    }
}

print(setArray.count)


/*

 [Substring 타입]
 - Swift에서 문자열(String)에서 일부만 분리하여 사용하기 위해 부분 문자열을 만들 수 있다.
     let greeting = "Hello, world!"
     let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
     let hello = greeting[..<index] // "Hello" 이고 Substring 타입
 
 [String.Index]
 - Swift의 문자열(String)의 인덱스로 정수를 받지 않고 String.Index를 사용
    -> String은 Character의 집합이고 Character는 유니코드 문자로 이루어지는데 유니코드의 크기가 다양하기 때문에 정수로 Index를 구분하기 어려움
 
*/
