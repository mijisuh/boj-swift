if let input = readLine() {
    var a = UnicodeScalar("a").value
    var z = UnicodeScalar("z").value

    var result = Array(repeating: -1, count: Int(z-a)+1)

    for i in 0..<input.count {
        let idx = Int(input[input.index(input.startIndex, offsetBy: i)].asciiValue!) - Int(a)
        if result[idx] == -1 {
            result[idx] = i
        }
    }

    print(result.map { String($0) }.joined(separator: " "))
}


/*

 [String 각 문자 접근]
 * String은 Index로 접근 불가
 
 1) Index 처럼 사용하기
 let word = "012345"
 let idx = 2
 print(word[word.index(word.startIndex, offsetBy: idx)] // 2
 
 2) indices 사용하기
 let word = "012345"
 for i in word.indices {
     print(word[i])
 }
 
 3) Array로 만들어서 사용하기
 var word = "012345"
 print(Array(input)[2]) // 3
 
*/
