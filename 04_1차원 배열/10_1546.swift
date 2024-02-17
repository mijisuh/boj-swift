if let _ = readLine() {
    if let input = readLine() {
        let inputArray = input.split { $0 == " " }.map { Double($0) ?? 0 }
        if let max = inputArray.max() {
            let sum = inputArray.reduce(0, +)
            print(sum / max / Double(inputArray.count) * 100)
        }
    }
}