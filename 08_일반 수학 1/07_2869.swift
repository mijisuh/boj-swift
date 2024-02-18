if let input = readLine() {
    let inputArray = input.split { $0 == " " }
    if let a = Int(inputArray[0]), let b = Int(inputArray[1]), let v = Int(inputArray[2]) {
        let dist = v - a // 이동해야 하는 거리
        let stride = a - b // 보폭
        var days = dist / stride
        if dist % stride > 0 { // 완주 선에 못미쳤을 때
            days += 1
        }
        print(days + 1)
    }
}
