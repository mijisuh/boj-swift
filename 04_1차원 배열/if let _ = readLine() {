if let input = readLine() {
    let v = input.split(separator: " ").map { Int($0) }[1]!
    if let arr = readLine() {
        let result = arr.split(separator: " ").map { Int($0) ?? 0 }.filter { $0 < v }
        print(result.map { String($0) }.joined(separator: " "))
    }
}


/*

[배열을 한 문자열로 출력하기] : for 문 vs joined(separator:)

* [String].joined(separator:) → String
문자열 끝에 원치 않는 whitespace가 생기는 것을 방지할 수 있음

*/