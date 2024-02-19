if let inputNM = readLine(), let inputCard = readLine() {
    let inputNMArray = inputNM.split { $0 == " " }
    let cards = inputCard.split { $0 == " " }.map { Int($0) ?? 0 }
    if let n = Int(inputNMArray[0]), let m = Int(inputNMArray[1]) {
        var result = 0
        for i in 0..<(n - 2) {
            for j in (i + 1)..<(n - 1) {
                for k in (j + 1)..<n {
                    let sum = cards[i] + cards[j] + cards[k]
                    
                    // 한도(= m)가 정해져 있기 때문에 한도보다 낮은 경우에 max()를 이용해 제일 큰 값을 찾아내면 됨
                    if sum <= m {
                        result = max(result, sum)
                    }
                }
            }
        }
        print(result)
    }
}
