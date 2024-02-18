if let input = readLine() {
    let inputArray = input.split { $0 == " " }
    if let n = Int(inputArray[0]), let k = Int(inputArray[1]) {
        var count = 0
        var result = 0
        for i in 1...n {
            if n % i == 0 {
                count += 1
                result = i
            }
            
            if count == k { // 해당 순서일 경우
                break
            }
        }
        
        if count < k { // 해당 순서보다 약수 개수가 작을 경우
            result = 0
        }
        print(result)
    }
}
