let n = Int(readLine() ?? "") ?? 0
let cards = Set((readLine() ?? "").split { $0 == " " })
let m = Int(readLine() ?? "") ?? 0
let inputs = (readLine() ?? "").split { $0 == " " }

print(inputs.map { cards.contains($0) ? "1" : "0" }.joined(separator: " "))


/*
 
 * Array.contains() → 시간 초과
 
*/
