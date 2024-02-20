if let _ = readLine() {
    var names: Set<String> = []
    while let input = readLine() {
        let name = String(input.split { $0 == " " }[0])
        if names.contains(name) { // 이미 출근한 사람이라면 삭제
            names.remove(name)
        } else {
            names.insert(name)
        }
    }
    print(names.sorted { $0 > $1 }.joined(separator: "\n"))
}
