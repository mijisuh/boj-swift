
if let input = readLine() {
    let alphabets: Set<String> = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]
    var i = 0
    var count = 0
    let inputArray = Array(input)
    while i < inputArray.count {
        defer {
            count += 1
            i += 1
        }
        
        for j in 1..<inputArray.count - i {
            if j > 2 { break }
            
            let word = String(inputArray[i...(i+j)])
            if alphabets.contains(word) {
                i += j
                break
            }
        }
    }
    print(count)
}


/*

 [Set, Array의 contains() 시간복잡도 비교]
 - Set: O(1) → Set은 Hash 기반의 데이터 구조로 구현되어 있어 빠른 검색이 가능
 - Array: O(n)
 
 [defer]
 - 보통 함수 안에 작성되는 클로저로 작성된 위치에 상관없이 함수 종료 직전에 실행되는 구문
 (자신의 실행을 함수 실행 마지막으로 ‘미루다’)
 - 함수를 종료하기 직전에 정리해야 하는 변수나 상수를 처리하기 위한 용도

 cf) while문에서는 한번 반복되어 종료될 때 실행
 
*/
