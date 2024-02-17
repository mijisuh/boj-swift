if let wordInput = readLine() {
    let wordArray = wordInput.map { $0 }
    if let numInput = readLine() {
        if let num = Int(numInput) {
            print(wordArray[num-1])
        }
    }
}


/*
 
 [문자열을 문자열 배열로 만들기] : for 문 vs Array 생성자 vs map 메서드
 // Array
 let str = "ABC"
 let arr = Array(str)

 // map
 let str = "ABC".map { $0 }
 
*/
