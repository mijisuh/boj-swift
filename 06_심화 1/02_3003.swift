let pieces = [1, 1, 2, 2, 2, 8]
if let input = readLine() {
    let inputArray = input.split { $0 == " " }
    for i in 0..<inputArray.count {
        if let num = Int(inputArray[i]) {
            print(pieces[i] - num, terminator: " ")
        }
    }
}


/*

 * print(_:terminator:)는 출력을 조작하는 함수로, 특히 텍스트를 출력할 때 줄 바꿈(\n)을 사용하지 않고 출력을 조절할 때 유용하다. terminator 매개변수는 출력 문자열의 끝을 지정하는데 사용됨(기본값은 줄 바꿈 문자("\n"))
 
*/
