func isPalindrome(_ s: [Character], _ l: Int, _ r: Int, _ count: Int) -> (Int, Int) {
    if l >= r {
        return (1, count)
    } else if s[l] != s[r] {
        return (0, count)
    } else {
        return isPalindrome(s, l + 1, r - 1, count + 1)
    }
}

let n = Int(readLine() ?? "") ?? 0
while let input = readLine() {
    let output = isPalindrome(Array(input), 0, input.count - 1, 1)
    print(output.0, output.1)
}


/*

 문자열의 각 문자를 String.Index를 사용하여 접근하면 시간 초과!
 
*/
