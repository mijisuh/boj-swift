let inputNM = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let n = inputNM[0]
let m = inputNM[1]

var sentences: Set<String> = []
for _ in 0..<n {
    let sentence = readLine() ?? ""
    sentences.insert(sentence)
}

var count = 0
for _ in 0..<m {
    let input = readLine() ?? ""
    if sentences.contains(input) { count += 1 }
}

print(count)
