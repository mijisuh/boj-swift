// MARK: 방법 1) 일일히 계산
if let input = readLine() {
    let inputArray = input.split { $0 == " " }
    let n = inputArray[0]
    let nLength = n.count
    var result = 0
    if let b = Int(inputArray[1]) {
        for (index, utf8Value) in n.utf8.enumerated() {
            var value = 1
            for _ in 0..<(nLength - index - 1) {
                value *= b
            }
            if utf8Value > 64 {
                result += (Int(utf8Value) - 65 + 10) * value
            } else {
                result += (Int(utf8Value) - 48) * value
            }
        }
        print(result)
    }
}

// MARK: 방법 2) Int 생성자 이용
if let input = readLine() {
    let inputArray = input.split { $0 == " " }
    let n = inputArray[0]
    if let b = Int(inputArray[1]),
        let result = Int(n, radix: b) {
        print(result)
    }
}


/*

 [String.utf8]
 - Swift에서 문자열은 Unicode로 표현되며, 문자열의 각 문자는 UTF-16로 인코딩되는데 String.utf8을 사용하면 UTF-8 형식으로 인코딩된 바이트 시퀀스에 접근할 수 있음
 
 [문자열을 정수로 변환해주는 Int의 생성자 함수]
 - init?(_ text: String, radix: Int = 10)
 - text: 정수로 변환할 문자열
 - radix: 문자열이 나타내는 정수의 진수
 
*/
