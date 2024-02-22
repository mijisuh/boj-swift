func getGCD(_ a: Int, _ b: Int) -> Int {
    return a % b == 0 ? b : getGCD(b, a % b)
}

func getLCM(_ a: Int, _ b: Int) -> Int {
    return a * b / getGCD(a, b)
}

let inputArray = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let a = inputArray[0], b = inputArray[1]
print(getLCM(a, b))
