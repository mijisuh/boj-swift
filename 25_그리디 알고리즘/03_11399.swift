// 방법 1) 누적합
let n = Int(readLine() ?? "") ?? 0
var times = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
times.sort()

for i in 1..<n {
    times[i] += times[i - 1]
}

print(times.reduce(0, +))

// 방법 2) 그리디 알고리즘let n = Int(readLine() ?? "") ?? 0
var times = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
times.sort(by: <)

var result = 0
for i in 0..<n {
    result += (n - i) * times[i]
}

print(result)
