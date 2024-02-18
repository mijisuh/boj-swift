if let _ = readLine() {
    if let input = readLine() {
        let inputArray = input.split { $0 == " " }.map { Int($0) ?? 0 }
        var result = 0
        
        for n in inputArray {
            var count = 0
            for i in 1..<n {
                if n % i == 0 {
                    count += 1
                }
            }
            if count == 1 { result += 1 }
        }
        
        print(result)
    }
}
