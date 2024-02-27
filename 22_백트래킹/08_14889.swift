let n = Int(readLine() ?? "") ?? 0
var powers: [[Int]] = []
while let input = readLine() {
    powers.append(input.split { $0 == " " }.map { Int($0) ?? 0 })
}

var visited = [Bool](repeating: false, count: n)
var minValue = Int.max

func dfs(_ depth: Int, _ start: Int) {
    if depth == n / 2 {
        var team1 = 0, team2 = 0
        for i in 0..<n {
            for j in 0..<n {
                if visited[i] && visited[j] {
                    team1 += powers[i][j]
                }

                if !visited[i] && !visited[j] {
                    team2 += powers[i][j]
                }
            }
        }
        minValue = min(minValue, abs(team1 - team2))
        return
    }

    for i in start..<n {
        if !visited[i] {
            visited[i] = true
            dfs(depth + 1, i)
            visited[i] = false
        }
    }
}

dfs(0, 0)
print(minValue)
