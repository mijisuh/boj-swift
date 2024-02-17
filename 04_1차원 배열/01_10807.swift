if let _ = readLine() {
    if let input = readLine(), let v = readLine() {
        let values = input.split{ $0 == " " }.map{ Int($0) ?? 0 }.filter{ $0 == Int(v) ?? 0 }
        print(values.count)
    }
}