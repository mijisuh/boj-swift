// 방법 1) 3중 for문
let nm = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0}
let (n, m) = (nm[0], nm[1])
let a = (0..<n).map { _ in
    (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
}
let mk = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0}
let k = mk[1]
let b = (0..<m).map { _ in
    (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
}

for x in 0..<n {
    for y in 0..<k {
        var tmp = 0
        for z in 0..<m {
            tmp += a[x][z] * b[z][y]
        }
        print(tmp, terminator: " ")
    }
    print()
}
