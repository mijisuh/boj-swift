if let input = readLine() {
    if let num = Int(input) {
        var result = ""
        for i in 1...num {
            result += String(repeating: " ", count: num-i)
            result += String(repeating: "*", count: 2 * i - 1) + "\n"
        }
        
        for i in 1..<num {
            result += String(repeating: " ", count: i)
            result += String(repeating: "*", count: 2 * (num - i) - 1) + "\n"
        }
        
        print(result)
    }
}
