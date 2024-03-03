let str = (readLine() ?? "").map { Int($0.asciiValue ?? 0) }
let n = Int(readLine() ?? "") ?? 0

let aAscii = Int(Character("a").asciiValue!)

var psum = [[Int]](repeating: [Int](repeating: 0, count: 26), count: str.count)
var tmp = [Int](repeating: 0, count: 26) // 모든 알파벳에 대한 누적합

for i in 0..<str.count {
    tmp[str[i] - aAscii] += 1
    psum[i] = tmp
}

while let input = readLine() {
    let inputs = input.split { $0 == " " }
    let ch = Int(Character(String(inputs[0])).asciiValue ?? 0), from = Int(inputs[1]) ?? 0, to = Int(inputs[2]) ?? 0
    if from == 0 {
        print(psum[to][ch - aAscii])
    } else {
        print(psum[to][ch - aAscii] - psum[from - 1][ch - aAscii])
    }
}
