// MARK: 방법 1) 곱하면서 찾기
if let _ = readLine() {
    while let input = readLine() {
        let inputArray = input.split { $0 == " " }.map { Int($0) ?? 0 }
        let multipleA = inputArray[0]
        let multipleB = inputArray[1]
    
        var a = multipleA
        var b = multipleB
    
        while a != b {
            if a < b {
                a += multipleA
            } else {
                b += multipleB
            }
        }
    
        print(a)
    }
}

// MARK: 방법 2) 최대공약수로 계산
func getGCD(_ a: Int, _ b: Int) -> Int {
    return a % b == 0 ? b : getGCD(b, a % b)
}

func getLCM(_ a: Int, _ b: Int) -> Int {
    return a * b / getGCD(a, b)
}

if let _ = readLine() {
    while let input = readLine() {
        let inputArray = input.split { $0 == " " }.map { Int($0) ?? 0 }
        let a = inputArray[0]
        let b = inputArray[1]
        
        print(getLCM(a, b))
      }
}

/*

 [최소공배수(The Least Common Multiple)]
 = 두 수의 곱 / 최대공약수

 [최대공약수(The Greatest Common Divisor)]
 1. 소인수분해 후 공통의 소수 찾기
 2. 유클리드 호제법 사용 → 나머지 연산을 통해 구현
 
*/
