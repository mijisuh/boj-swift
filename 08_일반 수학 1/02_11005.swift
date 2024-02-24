// MARK: 방법 1) 일일히 계산
if let input = readLine() {
    let inputArray = input.split { $0 == " " }
    if let nInput = Int(inputArray[0]), let b = Int(inputArray[1]) {
        var n = nInput
        var idxArray: [Int] = []
        while n > 0 {
            idxArray.append(n % b)
            n /= b
        }
        
        var result = ""
        for idx in idxArray.reversed() {
            if idx > 9 {
                if let unicodeScalar = UnicodeScalar(idx - 10 + 65) {
                    result += String(unicodeScalar)
                }
            } else {
                result += String(idx)
            }
        }
        
        print(result)
    }
}

// MARK: 방법 2) String 생성자 이용
if let input = readLine() {
    let inputArray = input.split { $0 == " " }
    if let n = Int(inputArray[0]), let b = Int(inputArray[1]) {
        let result = String(n, radix: b).uppercased()
        print(result)
    }
}


/*

 [10진수를 특정 진수로 변환]
 - n(10진법 수)을 b(진수)로 계속 나누는 과정 중 생겨나는 나머지들의 역순
 
 [Ascii 값을 문자로 표현하는 방법]
 - Ascii 값을 UnicodeScalar로 변환 후 Character/String으로 형 변환
 
 [정수를 특정 진수로 표현한 문자열 변환해주는 String 생성자]
 - init<T>(_ value: T, radix: Int = 10, uppercase: Bool = true) where T : BinaryInteger
 - value: 문자열로 변환할 정수값
 - radix: 정수를 나타내는데 사용될 진수(기본값은 10)
 - uppercase: 결과 문자열이 대문자로 표현될지 여부를 나타내는 불리언 값 (기본값은 true)
 
*/
