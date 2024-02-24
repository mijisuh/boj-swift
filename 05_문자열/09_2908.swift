// MARK: 방법 1) Int로 변환해서 비교
if let input = readLine() {
    let inputArray = input.split { $0 == " " }
    let first = String(inputArray[0].reversed())
    let second = String(inputArray[1].reversed())
    
    if let firstNum = Int(first), let secondNum = Int(second) {
        firstNum < secondNum ? print(secondNum) : print(firstNum)
    }
}

// MARK: 방법 2) String 그대로 비교
if let input = readLine() {
    if let result = input.split { $0 == " " }.map { String($0.reversed()) }.max() {
        print(result)
    }
}


/*

 [String 간 대소 비교]
 [String].max()의 반환 값은 ”해당 배열에서 사전적으로 가장 큰 문자열” 이다.
 여기서 ”가장 큰”이라는 비교는 문자열이 유니코드에서 사전적으로 비교될 때의 순서이다.
 따라서 숫자 값의 문자열일 경우도 비교가 가능하다.
 
 * 두 수의 크기를 비교하는 경우 → max()
 * String.reversed()의 리턴 타입은 ReversedCollection<String.SubSequence> 이므로
 String으로 형 변환 해주자!
 
*/
