let n = Int(readLine() ?? "") ?? 0
let weights = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let m = Int(readLine() ?? "") ?? 0
let marbles = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }

var dp = [[Bool]](repeating: [Bool](repeating: false, count: 40000), count: n + 1)
// dp[i][weight]: i번째까지의 추를 고려해서 w 무게를 측정할 수 있으면 true, 아니면 false

func solve(_ i: Int, _ w: Int) {
    if dp[i][w] { return }
    dp[i][w] = true

    if i >= n { return }
    
    solve(i + 1, w)
    solve(i + 1, w + weights[i])
    solve(i + 1, abs(w - weights[i]))
}

solve(0, 0)
print(marbles.map { $0 <= 15000 && dp[n][$0] ? "Y" : "N" }.joined(separator: " "))
