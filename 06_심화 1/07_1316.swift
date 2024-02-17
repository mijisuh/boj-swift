if let input = readLine() {
    if let nums = Int(input) {
        var count = nums
        
        while let word = readLine() {
            var tempArray = Array<Character>()
        
            for char in word {
                if !tempArray.contains(char) {
                    tempArray.append(char)
                }
                
                if let last = tempArray.last, last != char {
                    count -= 1
                    break
                }
            }
        }

        print(count)
    }
}
