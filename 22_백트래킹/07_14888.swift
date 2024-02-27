let n = Int(readLine() ?? "") ?? 0
let operands = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
var operators = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
var results: [Int] = []

func dfs(_ result: Int, _ depth: Int) {
    if depth == n {
        results.append(result)
        return
    }

    for i in 0..<4 {
        if operators[i] > 0 {
            operators[i] -= 1
            switch i {
                case 0: dfs(result + operands[depth], depth + 1)
                case 1: dfs(result - operands[depth], depth + 1)
                case 2: dfs(result * operands[depth], depth + 1)
                case 3: dfs(result / operands[depth], depth + 1)
                default: break
            }
            operators[i] += 1
        }
    }
}

dfs(operands[0], 1)
print(results.max() ?? 0)
print(results.min() ?? 0)
