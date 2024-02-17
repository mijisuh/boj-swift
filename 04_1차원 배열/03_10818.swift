if let _ = readLine() {
    if let input = readLine() {
        let arr = input.split { $0 == " " }.map { Int($0)! }
        let min = arr.min()!
        let max = arr.max()!
        
        print(min, max)
    }
}
