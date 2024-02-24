// MARK: 방법 1) split 활용
if let input = readLine() {
    let count = input.split { $0 == " " }.count
    print(count)
}

// MARK: 방법 2) reduce 활용
if let input = readLine() {
    var count = input.reduce(0) { (result, element) in
        return element == " " ? result + 1 : result
    } + 1
    
    if let first = input.first, first == " " { // 맨 앞에 공백이 있는 경우
        count -= 1
    }
    
    if let last = input.last, last == " " { // 맨 뒤에 공백이 있는 경우
        count -= 1
    }
    
    print(count)
}


/*
 
 [Reduce]
 let reduceArray = arrayTest.reduce(0) { (result, element) -> Int in
     return result + element
 }

 // 간략화
 let reduceArrayShort = arrayTest.reduce(0) { $0 + $1 }
 
*/
