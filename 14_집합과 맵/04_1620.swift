// 방법 1) 딕셔너리 2개 사용
let inputNM = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let n = inputNM[0]
let m = inputNM[1]

var dic1: [String: Int] = [:]
var dic2: [Int: String] = [:] // 배열과 동일
for i in 1...n {
    let name = String(readLine() ?? "")
    dic1[name] = i
    dic2[i] = name
}

for _ in 0..<m {
    let input = String(readLine() ?? "")
    if let index = Int(input) {
        print(dic2[index] ?? "")
    } else {
        print(dic1[input] ?? 0)
    }
}

// 방법 2) 딕셔너리와 배열 사용
// 메모리: 92144 KB -> 87612 KB, 시간: 296 ms -> 264 ms
let inputNM = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let n = inputNM[0]
let m = inputNM[1]

var dic: [String: Int] = [:]
var array = Array<String>(repeating: " ", count: n + 1)
for i in 1...n {
    let name = String(readLine() ?? "")
    dic[name] = i
    array[i] = name
}

for _ in 0..<m {
    let input = String(readLine() ?? "")
    if let index = Int(input) {
        print(array[index])
    } else {
        print(dic[input] ?? 0)
    }
}
