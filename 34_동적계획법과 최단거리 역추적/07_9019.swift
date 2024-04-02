// 방법 1) DSLR 문자열 그대로 더함
extension Int {
    var d: Int {
        return self * 2 % 10_000
    }
    var s: Int {
        return self == 0 ? 9_999 : self - 1
    }
    var l: Int {
        return (self % 1_000) * 10 + self / 1_000
    }
    var r: Int {
        return (self % 10) * 1_000 + self / 10
    }
}

func isValid(_ n: Int) -> Bool {
    return 0..<10_000 ~= n
}

func left(_ n: Int) -> Int {
    let str = String(n)
    let rotatedStr = str.dropFirst() + String(str.first!)
    return Int(rotatedStr) ?? n
}

func right(_ n: Int) -> Int {
    let str = String(n)
    let rotatedStr =  String(str.last!) + str.dropLast()
    return Int(rotatedStr) ?? n
}

func bfs(_ from: Int, _ to: Int) {
    var visited = [Int](repeating: 0, count: 10_000)

    var queue = [(from, "")]
    var index = 0

    while queue.count > index {
        let (current, operators) = queue[index]
        index += 1

        if current == to {
            print(operators)
            break
        }

        var next = current.d
        if isValid(next), visited[next] == 0 {
            visited[next] = visited[current] + 1
            queue.append((next, operators + "D"))
        }
        
        next = current.s
        if isValid(next), visited[next] == 0 {
            visited[next] = visited[current] + 1
            queue.append((next, operators + "S"))
        }
        
        next = current.l
        if isValid(next), visited[next] == 0 {
            visited[next] = visited[current] + 1
            queue.append((next, operators + "L"))
        }

        next = current.r
        if isValid(next), visited[next] == 0 {
            visited[next] = visited[current] + 1
            queue.append((next, operators + "R"))
        }
    }
}

let _ = readLine()
while let input = readLine() {
    let AB = input.split { $0 == " " }.map { Int($0) ?? 0 }
    let (A, B) = (AB[0], AB[1])
    bfs(A, B)
}

// 방법 2) DSLR -> 1234로 대응
// 시간 단축: 5108 ms(방법 1) -> 3324 ms
extension Int {
    var d: Int {
        return self * 2 % 10_000
    }
    var s: Int {
        return self == 0 ? 9_999 : self - 1
    }
    var l: Int {
        return (self % 1_000) * 10 + self / 1_000
    }
    var r: Int {
        return (self % 10) * 1_000 + self / 10
    }
}

func isValid(_ n: Int) -> Bool {
    return 0..<10_000 ~= n
}

func left(_ n: Int) -> Int {
    let str = String(n)
    let rotatedStr = str.dropFirst() + String(str.first!)
    return Int(rotatedStr) ?? n
}

func right(_ n: Int) -> Int {
    let str = String(n)
    let rotatedStr = String(str.last!) + str.dropLast()
    return Int(rotatedStr) ?? n
}

func bfs(_ from: Int, _ to: Int) {
    var visited = [Bool](repeating: false, count: 10_000)

    var queue = [(from, 0)]
    var index = 0

    while queue.count > index {
        let (current, operators) = queue[index]
        index += 1

        if current == to {
            var answer = ""
            for op in String(operators) {
                answer += ops[Int(String(op))!] // 숫자 -> 문자
            }
            print(answer)
            break
        }

        for (idx, next) in [current.d, current.s, current.l, current.r].enumerated() {
            if isValid(next), visited[next] == false {
                visited[next] = true
                queue.append((next, operators * 10 + idx + 1)) // 각 자릿수에 문자 대신 숫자로 저장
            }
        }
    }
}

let ops = ["", "D", "S", "L", "R"] // "D", "S", "L", "R" 을 1, 2, 3, 4로 대응

let _ = readLine()
while let input = readLine() {
    let AB = input.split { $0 == " " }.map { Int($0) ?? 0 }
    let (A, B) = (AB[0], AB[1])
    bfs(A, B)
}
