// MARK: 방법 1) Set만 사용 - 정렬할 때 배열의 크기를 count
var words: Set<String> = []
if let inputN = readLine() {
    if let n = Int(inputN) {
        for _ in 0..<n {
            if let inputWord = readLine() {
                words.insert(inputWord)
            }
        }
        
        let sortedArray = words.sorted { ($0.count, $0) < ($1.count, $1) } // Set은 sort() 함수가 없고 sorted()만 있음(반환 타입 Array)
        sortedArray.forEach { print($0) }
    }
}

// MARK: 방법 2) Set과 Tuple을 함께 사용 - 정렬하기 전에 배열의 크기를 저장
// 시간: 480 ms(방법 1) -> 68 ms
var words: Set<String> = []
if let inputN = readLine() {
    if let n = Int(inputN) {
        for _ in 0..<n {
            if let inputWord = readLine() {
                words.insert(inputWord)
            }
        }
        
        let tuples: [(Int, String)] = words.map { ($0.count, $0) } // 튜플로 미리 정보 저잘
        
        let sortedWords = tuples.sorted { $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 }.map { $1 }
        sortedWords.forEach {
            print($0)
        }
    }
}


/*

 words가 Array 일 경우,
 words.sort { ($0.count, $0) < ($1.count, $1) } → 시간 초과
 
*/
