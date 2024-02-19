if let input = readLine() {
    let inputArray = input.split { $0 == " " }
    if let x = Int(inputArray[0]), let y = Int(inputArray[1]),
        let w = Int(inputArray[2]), let h = Int(inputArray[3]) {
            print(min(x, y, w - x, h - y))
        }
    }
