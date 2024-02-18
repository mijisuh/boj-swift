if let input = readLine() {
    if let n = Int(input) {
        var result = 2
        for _ in 0..<n {
            result += result - 1
        }
        print(result*result)
    }
}

/*

 [수열의 규칙 찾기] → 직전 수 + (직전 수 - 1)
 1    2    3    4    5     6      …     i
 2    3    5    9    17    33    …    N-1    N
 +1   +2   +4   +8   +16              +N-2
 
*/
