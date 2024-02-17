if let _ = readLine() {
    while let input = readLine() {
        let inputArray = input.split { $0 == " "}
        if let nums = Int(inputArray[0]) {
            var result = ""
            let charArray = Array(inputArray[1])
            charArray.forEach {
                result += String(repeating: $0, count: nums)
            }
            print(result)
        }
    }
}
