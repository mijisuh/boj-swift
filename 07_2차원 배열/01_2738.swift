if let inputNM = readLine() {
    let inputNMArray = inputNM.split { $0 == " " }
    if let n = Int(inputNMArray[0]), let m = Int(inputNMArray[1]) {
        var array1: [[Int]] = []
        for i in 0..<n {
            if let input = readLine() {
                let inputArray = input.split { $0 == " " }.map { Int($0) ?? 0 }
                array1.append(inputArray)
            }
        }
        
        var array2: [[Int]] = []
        for i in 0..<n {
            if let input = readLine() {
                let inputArray = input.split { $0 == " " }.map { Int($0) ?? 0 }
                array2.append(inputArray)
            }
        }
        
        for i in 0..<n {
            for j in 0..<m {
                print(array1[i][j] + array2[i][j], terminator: " ")
            }
            print("")
        }
    }
}
