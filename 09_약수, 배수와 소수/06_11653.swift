// 방법 1) 모든 경우의 수 고려
if let input = readLine() {
    if let n = Int(input), n != 1 {
        var temp = n
        for i in 2...n {
            while temp % i == 0 {
                temp /= i
                print(i)
            }
        }
    }
}

// 방법 2) 연산 조건을 추가해서 시간 단축
if let input = readLine() {
    if let n = Int(input), n != 1 {
        var temp = n
        var i = 2
        var result = ""
        while temp >= i * i { // 피제수가 제수의 제곱보다 클 경우에만 계산
            if temp % i == 0 {
                temp /= i
                result += "\(i)\n"
            } else {
                i += 1
            }
        }
        print(temp > 1 ? result + "\(temp)" : result)
    }
}
