// 방법 1)
let nmk = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])
var psumB = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)
var psumW = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)

for i in 1...n {
    let inputs = Array(readLine() ?? "")
    for j in 1...m { // 1 2 3 4
        if i % 2 == 0 {
            if j % 2 == 0 {
                psumW[i][j] = 0 // 1 0 1 0
                psumB[i][j] = 1
            } else {
                psumW[i][j] = 1
                psumB[i][j] = 0 // 0 1 0 1
            }
        } else {
            if j % 2 == 0 {
                psumB[i][j] = 0
                psumW[i][j] = 1
            } else {
                psumB[i][j] = 1
                psumW[i][j] = 0
            }
        }

        psumB[i][j] = (inputs[j - 1] == "B" && psumB[i][j] == 1) || (inputs[j - 1] == "W" && psumB[i][j] == 0) ? 0 : 1
        psumW[i][j] = (inputs[j - 1] == "B" && psumW[i][j] == 1) || (inputs[j - 1] == "W" && psumW[i][j] == 0) ? 0 : 1
        
        psumB[i][j] += psumB[i][j - 1] + psumB[i - 1][j] - psumB[i - 1][j - 1]
        psumW[i][j] += psumW[i][j - 1] + psumW[i - 1][j] - psumW[i - 1][j - 1]
    }
}

var result = Int.max
for i in 1...(n - k + 1) {
    for j in 1...(m - k + 1) {
        let psumBCount = psumB[i + k - 1][j + k - 1] - psumB[i - 1][j + k - 1] - psumB[i + k - 1][j - 1] + psumB[i - 1][j - 1]
        let psumWCount = psumW[i + k - 1][j + k - 1] - psumW[i - 1][j + k - 1] - psumW[i + k - 1][j - 1] + psumW[i - 1][j - 1]
        result = min(result, psumBCount, psumWCount)
    }
}

print(result)

// 방법 2) 코드 최적화
let nmk = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])
var psumB = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)
var psumW = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)

for i in 1...n {
    let inputs = Array(readLine() ?? "")
    for j in 1...m {
        if (i + j) % 2 == 0 {
            psumB[i][j] = inputs[j - 1] != "B" ? 1 : 0
            psumW[i][j] = inputs[j - 1] != "W" ? 1 : 0
        } else {
            psumB[i][j] = inputs[j - 1] == "B" ? 1 : 0
            psumW[i][j] = inputs[j - 1] == "W" ? 1 : 0
        }

        psumB[i][j] += psumB[i][j - 1] + psumB[i - 1][j] - psumB[i - 1][j - 1]
        psumW[i][j] += psumW[i][j - 1] + psumW[i - 1][j] - psumW[i - 1][j - 1]
    }
}

var result = Int.max
for i in 1...(n - k + 1) {
    for j in 1...(m - k + 1) {
        let psumBCount = psumB[i + k - 1][j + k - 1] - psumB[i - 1][j + k - 1] - psumB[i + k - 1][j - 1] + psumB[i - 1][j - 1]
        let psumWCount = psumW[i + k - 1][j + k - 1] - psumW[i - 1][j + k - 1] - psumW[i + k - 1][j - 1] + psumW[i - 1][j - 1]
        result = min(result, psumBCount, psumWCount)
    }
}

print(result)
