if let inputNK = readLine() {
    let inputArray = inputNK.split { $0 == " " }
    if let n = Int(inputArray[0]), let k = Int(inputArray[1]) {
        if let inputScore = readLine() {
            var scores = inputScore.split { $0 == " " }.map { Int($0) ?? 0 }
            scores.sort { $0 > $1 }
            print(scores[k - 1])
        }
    }
}
