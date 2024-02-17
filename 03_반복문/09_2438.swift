let input = Int(readLine()!)!
var result = ""
for i in 1...input {
    result += String(repeating: "*", count: i) + "\n"
}
print(result)