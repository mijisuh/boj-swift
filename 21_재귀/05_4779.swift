import Foundation

func split(_ n: Int) -> String {
    if n <= 1 { // n == 3 인 경우, "- -"
        return "-"
    }
    let line = split(n / 3)
    return line + String(repeating: " ", count: n / 3) + line
}

while let n = Double(readLine() ?? "") {
    print(split(Int(pow(3, n))))
}


/*

[패턴 찾기] -> “- -” 의 반복 패턴
 n = 0 -> -
 n = 1 -> - -
 n = 2 -> - -   - -
 n = 3 -> - -   - -         - -   - -
 ...
 
*/
