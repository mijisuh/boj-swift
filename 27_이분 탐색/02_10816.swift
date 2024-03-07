// 방법 1) 이분 탐색으로 lowerBound, upperBound 구함
// lowerBound: 원하는 값 이상의 값의 위치
// upperBound: 원하는 값 초과의 값의 위치
_ = readLine() ?? ""
let a = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }.sorted()
_ = readLine() ?? ""
let b = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }

func lowerBound(_ target: Int, _ array: [Int]) -> Int {
    var start = 0
    var end = array.count
    var mid: Int { (start + end) / 2 }
    var count = 0
    while start < end {
        if array[mid] < target {
            start = mid + 1
        } else { // target인 경우 앞으로 이동하면서 범위를 좁힘
            end = mid
        }
    }
    return start
}

func upperBound(_ target: Int, _ array: [Int]) -> Int {
    var start = 0
    var end = array.count
    var mid: Int { (start + end) / 2 }
    var count = 0
    while start < end {
        if array[mid] <= target { // target인 경우 뒤로 이동하면서 범위를 좁힘
            start = mid + 1
        } else {
            end = mid
        }
    }
    return end
}

var result = ""
b.forEach {
    result += "\(upperBound($0, a) - lowerBound($0, a)) "
}

print(result)

// 방법 2) Dictionary 활용 O(1)
_ = readLine() ?? ""
let a = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
_ = readLine() ?? ""
let b = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }

var dict: [Int: Int] = [:]
var result = ""

a.forEach {
    dict[$0, default: 0] += 1
}

b.forEach {
    result += "\(dict[$0] ?? 0) "
}

print(result)
