if let input = readLine() {
    if let n = Int(input) {
        var result = 0
        for i in 1...n { // 생성자 < 분해합
            var sum = i
            for num in String(i) {
                sum += Int(String(num)) ?? 0
            }
            
            if sum == n {
                result = i
                break
            }
        }
        print(result)
    }
}
