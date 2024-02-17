let nums = Int(readLine()!)!

for i in 0..<nums {
    let result = readLine()!.split(separator: " ").reduce(0) { Int(String($0))! + Int(String($1))! }
    print(result)
}