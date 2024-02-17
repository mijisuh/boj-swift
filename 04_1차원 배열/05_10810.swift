if let nm = readLine() {
    let inputs = nm.split { $0 == " " }.map { Int($0) }
    if let n = inputs[0], let m = inputs[1] {
        var result = Array(repeating: 0, count: n)
        
        for _ in 0..<m {
            if let arr = readLine() {
                let bucket = arr.split { $0 == " "}.map { Int($0) }
                
                if let i = bucket[0], let j = bucket[1], let k = bucket[2] {
                    for idx in i...j {
                        result[idx-1] = k
                    }
                }
            }
        }
        
        print(result.map { String($0) }.joined(separator: " "))
    }
}