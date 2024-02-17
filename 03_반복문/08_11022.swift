let input = Int(readLine()!)!
for i in 1...input {
    let result = readLine()!.split(separator: " ").map { Int($0)! }
    print("Case #\(i): \(result[0]) + \(result[1]) = \(result[0] + result[1])")
}