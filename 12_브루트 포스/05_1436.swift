if let input = readLine() {
    if let n = Int(input) {
        var count = 1
        var num = 666
        while count < n {
            num += 1
            var temp = num
            while temp >= 666 { // '...666' 형태의 최솟값이 666
                if temp % 1000 == 666 { // '...666' 형태일 때
                    count += 1
                    break
                }
                temp /= 10 // '...666' 형태로 만듬
            }
        }
        print(num)
    }
}
