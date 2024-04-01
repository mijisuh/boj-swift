typealias Point = (x: Int, y: Int)

func getDist(_ start: Point, _ end: Point) -> Int {
    return abs(start.x - end.x) + abs(start.y - end.y)
}

func getMinDist(_ firstCaseIdx: Int, _ secondCaseIdx: Int) -> Int { // first: 1번 경찰차가 마지막으로 해결한 사건 번호, second도 동일
    if firstCaseIdx == w || secondCaseIdx == w { return 0 }
    if dp[firstCaseIdx][secondCaseIdx] != -1 { return dp[firstCaseIdx][secondCaseIdx] }

    // 다음 사건 번호
    let nextCaseIdx = max(firstCaseIdx, secondCaseIdx) + 1

    // 마지막으로 해결한 사건 번호로 경찰차들의 마지막 위치를 알 수 있음
    let firstPos = firstCaseIdx == 0 ? Point(1, 1) : cases[firstCaseIdx]
    let secondPos = secondCaseIdx == 0 ? Point(n, n) : cases[secondCaseIdx]

    // 현재 사건을 1번 경찰차가 해결(firstCaseIdx -> nextCaseIdx)
    let firstDist = getDist(firstPos, cases[nextCaseIdx])

    // 현재 사건을 2번 경찰차가 해결(secondCaseIdx -> nextCaseIdx)
    let secondDist = getDist(secondPos, cases[nextCaseIdx])

    dp[firstCaseIdx][secondCaseIdx] = min(
        getMinDist(nextCaseIdx, secondCaseIdx) + firstDist,
        getMinDist(firstCaseIdx, nextCaseIdx) + secondDist
    )

    return dp[firstCaseIdx][secondCaseIdx]
}

func trace(_ firstCaseIdx: Int, _ secondCaseIdx: Int) {
    if firstCaseIdx == w || secondCaseIdx == w { return }

    let nextCaseIdx = max(firstCaseIdx, secondCaseIdx) + 1

    let firstPos = firstCaseIdx == 0 ? Point(1, 1) : cases[firstCaseIdx]
    let secondPos = secondCaseIdx == 0 ? Point(n, n) : cases[secondCaseIdx]

    let firstDist = getDist(firstPos, cases[nextCaseIdx])
    let secondDist = getDist(secondPos, cases[nextCaseIdx])

    if dp[nextCaseIdx][secondCaseIdx] + firstDist < dp[firstCaseIdx][nextCaseIdx] + secondDist {
        print(1)
        trace(nextCaseIdx, secondCaseIdx)
    } else {
        print(2)
        trace(firstCaseIdx, nextCaseIdx)
    }
}

let n = Int(readLine() ?? "") ?? 0
let w = Int(readLine() ?? "") ?? 0

var dp = [[Int]](repeating: [Int](repeating: -1, count: w + 1), count: w + 1)
var cases: [Point] = [] // 경찰차의 위치

while let input = readLine() {
    let inputs = input.split { $0 == " " }.map { Int($0) ?? 0 }
    let caseIdx = Point(inputs[0], inputs[1])
    cases.append(caseIdx)
}

print(getMinDist(0, 0))
trace(0, 0)
