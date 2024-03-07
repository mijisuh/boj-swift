// 방법 1) 이진 탐색
let n = Int(readLine() ?? "") ?? 0
let a = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let m = Int(readLine() ?? "") ?? 0
let b = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let sortedA = a.sorted()

func find(_ target: Int, _ array: [Int]) -> Int {
    var start = 0
    var end = array.count - 1
    var mid: Int { (start + end) / 2 } // Computed Property로 읽기 전용이고 읽을 때마다 start와 end를 불러와서 계산
    
    while start <= end {
        // let mid = (start + end) / 2
        if target == sortedA[mid] {
            return 1
        } else if target < sortedA[mid] {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return 0
}

b.forEach {
    print(find($0, sortedA))
}

// 방법 2) Set, contains() 활용
_ = readLine() ?? ""
let a = Set((readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 })
_ = readLine() ?? ""
let b = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }

b.forEach {
    print(a.contains($0) ? "1" : "0")
}
