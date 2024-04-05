// 방법 1) Array.firstIndex(of:)
func dfs(_ inStart: Int, _ inEnd: Int, _ postStart: Int, _ postEnd: Int) {
    guard inStart <= inEnd, postStart <= postEnd else { return }

    let root = postOrder[postEnd]
    answer += "\(root) "

    let rootIndex = inOrder.firstIndex(of: root)!

    let leftCount = rootIndex - inStart - 1
    let rightCount = inEnd - rootIndex

    dfs(inStart, rootIndex - 1, postStart, postStart + leftCount)
    dfs(rootIndex + 1, inEnd, postEnd - rightCount, postEnd - 1)
}

let n = Int(readLine() ?? "") ?? 0
let inOrder = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let postOrder = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }

var answer = ""

dfs(0, n - 1, 0, n - 1)
print(answer)

// 방법 2) index 테이블 생성
// 시간 단축: 2516 ms(방법 1) -> 116 ms
func dfs(_ inStart: Int, _ inEnd: Int, _ postStart: Int, _ postEnd: Int) {
    guard inStart <= inEnd, postStart <= postEnd else { return }

    let root = postOrder[postEnd]
    answer += "\(root) "

    let rootIndex = inOrderDict[root]!

    let leftCount = rootIndex - inStart - 1
    let rightCount = inEnd - rootIndex

    dfs(inStart, rootIndex - 1, postStart, postStart + leftCount)
    dfs(rootIndex + 1, inEnd, postEnd - rightCount, postEnd - 1)
}

let n = Int(readLine() ?? "") ?? 0
let inOrder = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let postOrder = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }

var inOrderDict: [Int: Int] = [:]
inOrder.enumerated().forEach { index, value in
    inOrderDict[value] = index
}

var answer = ""

dfs(0, n - 1, 0, n - 1)
print(answer)
