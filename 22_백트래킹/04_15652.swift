let input = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let n = input[0], m = input[1]
var result = ""

func dfs(_ nums: String, _ count: Int, _ current: Int) {
    if count == m {
        result += "\(nums)\n"
        return
    }

    for i in current...n {
        dfs(nums + "\(i) ", count + 1, i)
    }
}

dfs("", 0, 1)
print(result)
