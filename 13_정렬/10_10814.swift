var members: [(age: Int, name: String)] = []
if let inputN = readLine() {
    if let n = Int(inputN) {
        for _ in 0..<n {
            if let inputMember = readLine() {
                let inputMemberArray = inputMember.split { $0 == " " }
                members.append((age: Int(inputMemberArray[0]) ?? 0, name: String(inputMemberArray[1])))
            }
        }
        
        members.sort { $0.age < $1.age } // 입력 순서를 보장(Timsort)
        members.forEach {
            print($0.age, $0.name)
        }
    }
}
