if let _ = readLine() {
    while let wordInput = readLine() {
        let wordArray = Array(wordInput)
        print("\(wordArray[0])\(wordArray[wordArray.count-1])")
    }
}
