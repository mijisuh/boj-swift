func lowerbound(_ array: [Int], _ target: Int) -> Int { // target보다 작거나 같은 값 중 가장 가까운 값의 인덱스
    var left = 0, right = array.count - 1
    var mid: Int { (left + right) / 2 }

    while left <= right {
        if array[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }

    return left
}

let n = Int(readLine() ?? "") ?? 0
let array = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }

var lis = [array[0]] // 오름차순으로 정렬됨
var index: [Int] = [0]

for i in 1..<n {
    if lis.last! < array[i] {
        lis.append(array[i])
        index.append(lis.count - 1)
    } else {
        let lowerbound = lowerbound(lis, array[i]) // 현재 값과 가장 가까이에 있는 작거나 같은 값을
        lis[lowerbound] = array[i] // 현재 값으로 대체
        index.append(lowerbound)
    }
}

var count = index.max()! + 1 // lis.count
print(count)

var result: [Int] = []
for i in (0..<n).reversed() {
    if index[i] + 1 == count {
        result.append(array[i])
        count -= 1
    }
}

print(result.reversed().map { String($0) }.joined(separator: " "))
