// MARK: 방법 1) Array 활용
var result = Array(1...30)
for _ in 0..<28 {
    if let input = readLine() {
        if let num = Int(input) {
            result[num-1] = 0
        }
    }
}
for i in 0..<30 {
    if result[i] != 0 {
        print(result[i])
    }
}

// MARK: 방법 2) Array 활용 + 메서드
var result = Array(1...30)
for _ in 0..<28 {
    if let input = readLine() {
        if let num = Int(input) {
            if result.contains(num) {
                if let index = result.firstIndex(of: num) {
                    result.remove(at: index)
                }
            }
        }
    }
}

for result in res.sorted() {
    print(result)
}

// MARK: 방법 3) Set 활용
var arr: Set<Int> = Set(1 ... 30)

while let input = readLine() {
    arr.remove(Int(input) ?? 0)
}

for result in arr.sorted() {
    print(result)
}


/*

[Array 메서드]
- Array.contains(_:) → Bool
- Array.index(of:) → Int?
- Array.sort() → Void

[Set 메서드]
- Set.remove(_:) → Void
- Set.sorted() → Set

*/
