let n = Int(readLine() ?? "") ?? 0
let cards = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let m = Int(readLine() ?? "") ?? 0
let inputs = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }

var dic: [Int: Int] = [:]
cards.forEach {
    if let value = dic[$0] {
        dic[$0] = value + 1
    } else {
        dic[$0] = 1
    }
}

var result = ""
inputs.forEach {
    result += String(dic[$0] ?? 0)
    result += " "
}
print(result)
