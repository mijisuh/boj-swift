let input = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let n = input[0], m = input[1]
var result = ""

func dfs(_ nums: String, _ count: Int) {
    if count == m {
        result += "\(nums)\n" // 바로 print하는 것보다 시간 단축(524 ms -> 220 ms)
        return
    }

    for i in 1...n {
        dfs(nums + "\(i) ", count + 1)
    }
}

dfs("", 0)
print(result)
