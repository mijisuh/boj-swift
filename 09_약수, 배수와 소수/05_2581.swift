func isPrime(_ n: Int) -> Bool {
    var count = 1
    for i in 1..<n {
        if n % i == 0 {
            count += 1
        }
        if count > 2 {
            return false
        }
    }
    return count == 1 ? false : true
}

while let mInput = readLine(), let nInput = readLine() {
    if let m = Int(mInput), let n = Int(nInput) {
        var sum = 0
        var min = -1
        for i in m...n {
            if isPrime(i) {
                sum += i
                if min == -1 { // 가장 처음 수 저장
                    min = i
                }
            }
        }
        
        if sum > 0 {
            print(sum)
        }
        print(min)
    }
}

