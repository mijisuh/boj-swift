if let _ = readLine() {
    if let wordInput = readLine() {
        let sum = wordInput.map { Int(String($0)) ?? 0 }.reduce(0, +)
        print(sum)
    }
}
