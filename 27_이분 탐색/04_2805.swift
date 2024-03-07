let nm = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (n, m) = (nm[0], nm[1])
let h = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }

var start = 1, end = h.max()!
var mid: Int { (start + end) / 2 }

while start <= end {
    let sum = h.filter { $0 >= mid }.map { $0 - mid }.reduce(0, +) // 자른 길이가 잘랐을 때 음수이면 안됨
    
    if sum >= m { // 잘라야 할 길이를 늘리자
        start = mid + 1
    } else { // 잘라야 할 길이를 줄이자
        end = mid - 1
    }
}

print(mid)
