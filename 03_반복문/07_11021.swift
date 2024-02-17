let input = Int(readLine()!)!
for i in 1...input {
    let result = readLine()!.split(separator: " ").reduce(0) { Int(String($0))! + Int(String($1))! }
    print("Case #\(i): \(result)")
}