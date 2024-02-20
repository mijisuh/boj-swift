var array: [Int] = []
if let _ = readLine() {
    while let input = readLine() {
        if let n = Int(input) {
            array.append(n)
        }
    }
    array.sorted().forEach {
        print($0)
    }
}
