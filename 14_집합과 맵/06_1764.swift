let inputNM = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let n = inputNM[0]
let m = inputNM[1]

var setArray1: Set<String> = []
var setArray2: Set<String> = []
while let input = readLine() {
    if setArray1.contains(input) {
        setArray2.insert(String(input))
    } else {
        setArray1.insert(String(input))
    }
}

print(setArray2.count)
print(setArray2.sorted().joined(separator: "\n"))
