let firstArray = Array(readLine() ?? "")
let secondArray = Array(readLine() ?? "")

var dp = [[Int]](repeating: [Int](repeating: 0, count: secondArray.count + 1), count: firstArray.count + 1)

for i in 1...firstArray.count {
    for j in 1...secondArray.count {
        if firstArray[i - 1] == secondArray[j - 1] { // 대각선으로 이동
            dp[i][j] = dp[i - 1][j - 1] + 1
        } else {
            dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
        }
    }
}

var count = dp.last!.last!
print(count)

var result: [Character] = []

var i = firstArray.count
var j = secondArray.count

while count != 0 {
    if dp[i - 1][j] == dp[i][j] {
        i -= 1
    } else if dp[i][j - 1] == dp[i][j] {
        j -= 1
    } else { // 대각선으로 이동한 경우
        result.append(firstArray[i - 1])
        i -= 1
        j -= 1
        count -= 1
    }
}

print(String(result.reversed()))
