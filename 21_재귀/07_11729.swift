// 방법 1) 이해가 쉬운 코드
var count = 0
var result = ""

func move(from: Int, to: Int) {
    result += "\(from) \(to)\n"
    count += 1
}

func hanoi(_ n: Int, from: Int, to: Int, by: Int) {
    if n == 1 {
        move(from: from, to: to)
        return
    }

    hanoi(n - 1, from: from, to: by, by: to)
    move(from: from, to: to)
    hanoi(n - 1, from: by, to: to, by: from)
}

let n = Int(readLine() ?? "") ?? 0
hanoi(n, from: 1, to: 3, by: 2)
print(count)
print(result)

// 방법 2) 시간 단축 코드
var count = 0, result = ""

func hanoi(_ n: Int, from: String, to: String, by: String) {
    count += 1
    if n == 1 {
        result.write("\(from) \(to)\n")
    } else {
        hanoi(n - 1, from: from, to: by, by: to)
        result.write("\(from) \(to)\n")
        hanoi(n - 1, from: by, to: to, by: from)
    }
}

let n = Int(readLine() ?? "") ?? 0
hanoi(n, from: "1", to: "3", by: "2") // 기둥이 String일 경우 308 ms(Int) -> 144 ms로 시간 단축
print(count)
print(result)
