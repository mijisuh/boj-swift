if let input = readLine() {
    var dic: [Character: Int] = [:]
    let uppercasedInput = input.uppercased()
    
    for char in uppercasedInput {
        if dic.keys.contains(char) {
            dic[char]! += 1
        } else {
            dic[char] = 1
        }
    }
    
    let sortedDic = dic.sorted { $0.value > $1.value }
        
    if sortedDic.count > 1 && sortedDic[0].value == sortedDic[1].value {
        print("?")
    } else {
        print(sortedDic[0].key)
    }
}


/*

 [문자열의 소문자를 대문자로 변경]
 -> String.uppercased()
 
*/
