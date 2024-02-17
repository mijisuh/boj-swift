var result = Set<Int>()

while let input = readLine() {
    if let num = Int(input) {
        result.insert(num % 42)
    }
}

print(result.count)