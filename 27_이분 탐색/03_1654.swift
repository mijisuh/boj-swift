let kn = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (k, n) = (kn[0], kn[1])
let array = (0..<k).map { _ in
    Int(readLine() ?? "") ?? 0
}

let maxValue = array.max() ?? 0
var start = 1, end = maxValue
var mid: Int { (start + end) / 2 } // 자를 랜선 길이

while start <= end {
    var count = 0
    array.forEach {
        count += $0 / mid
    }

    if count >= n { // 조건 충족하거나 개수를 줄여야 함(길이를 늘리자)
        start = mid + 1
    } else { // 개수를 늘려야 함(길이를 줄이자)
        end = mid - 1
    }
}

print(mid)
