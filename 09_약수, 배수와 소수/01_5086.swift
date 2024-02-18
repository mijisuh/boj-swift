while let input = readLine() {
    let inputArray = input.split { $0 == " " }
    if let a = Int(inputArray[0]), let b = Int(inputArray[1]) {
        if a == 0, b == 0 {
            break
        } else if b % a == 0 {
            print("factor")
        } else if a % b == 0 {
            print("multiple")
        } else {
            print("neither")
        }
    }
}
