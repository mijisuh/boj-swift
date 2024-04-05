// 방법 1) 완전 탐색
func findHigherIndex(_ start: Int, _ end: Int, _ compare: Int) -> Int {
    var higherIndex: Int = end
    for i in start..<end {
        if compare < preOrder[i] {
            higherIndex = i
            break
        }
    }
    return higherIndex
}

func dfs(_ start: Int, _ end: Int) {
    guard start < end else { return }

    let root = preOrder[start]
    let higherIndex: Int = findHigherIndex(start + 1, end, root)

    dfs(start + 1, higherIndex)
    dfs(higherIndex, end)
    print(root)
}

var preOrder: [Int] = []
while let input = Int(readLine() ?? "") {
    preOrder.append(input)
}

dfs(0, preOrder.count)

// 방법 2) upperbound
// 시간 단축: 60 ms(방법 1) -> 28 ms
func upperbound(_ start: Int, _ end: Int, _ target: Int) -> Int {
    var s = start
    var e = end
    var mid: Int { (s + e) / 2 }
    while s < e {
        if target < preOrder[mid] {
            e = mid
        } else {
            s = mid + 1
        }
    }
    return s
}

func dfs(_ start: Int, _ end: Int) {
    guard start < end else { return }
    
    let root = preOrder[start]
    let upperbound = upperbound(start + 1, end, root)
    
    dfs(start + 1, upperbound)
    dfs(upperbound, end)
    print(root)
}

var preOrder: [Int] = []
while let input = Int(readLine() ?? "") {
    preOrder.append(input)
}

dfs(0, preOrder.count)
