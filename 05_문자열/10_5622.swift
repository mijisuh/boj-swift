if let input = readLine() {
    var result = 0
    for char in input {
        result += 1
        
        switch char {
            case "A", "B", "C":
                result += 2
            case "D", "E", "F":
                result += 3
            case "G", "H", "I":
                result += 4
            case "J", "K", "L":
                result += 5
            case "M", "N", "O":
                result += 6
            case "P", "Q", "R", "S":
                result += 7
            case "T", "U", "V":
                result += 8
            case "W", "X", "Y", "Z":
                result += 9
            default:
                break
        }
    }
    print(result)
}
