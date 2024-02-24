while let input = readLine(), input != "-1" {
    var array: [Int] = []
    var sum = 0
    if let n = Int(input) {
        for i in 1..<n {
            if n % i == 0 {
                array.append(i)
                sum += i
            }
        }
        
        if sum == n {
            print("\(n) =", array.map { String($0) }.joined(separator: " + "))
        } else {
            print("\(n) is NOT perfect.")
        }
    }
}
