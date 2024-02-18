// 방법 1) 범위 경계선 중 앞의 수 기반으로 생각
// 2 -> 8 -> 20 -> 38 -> ... -> 2 + 6 * (n-1)
if let input = readLine() {
    if let n = Int(input) {
        var boundary = 2
        var count = 1
        while boundary <= n {
            boundary += 6 * count
            count += 1
        }
        print(count)
    }
}

// 방법 2) 범위 경계선 중 뒤의 수 기반으로 생각
// 7 -> 19 -> 37 -> ... 1 + 3 * n * (n + 1)
if let input = readLine() {
    if let n = Int(input) {
        var count = 0
        var boundary = 1
        while boundary < n {
            count += 1
            boundary = 1 + 3 * count * (count + 1)
        }
        print(count+1)
    }
}
