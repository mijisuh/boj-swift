let coins = [25, 10, 5, 1]
if let _ = readLine() {
    while let input = readLine() {
        if let change = Int(input) {
            var total = change
            coins.forEach {
                print(total / $0, terminator: " ")
                total %= $0
            }
            print()
        }
    }
}
