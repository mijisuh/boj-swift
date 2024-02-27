let input = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let n = input[0], m = input[1]
var visited = [Bool](repeating: false, count: n + 1)

func dfs(_ nums: String, _ count: Int, _ current: Int) {
    if count == m {
        print(nums)
        return
    }

    for i in current...n { // 현재 이전 값은 볼 필요 X
        if !visited[i] {
            visited[i] = true
            dfs(nums + "\(i) ", count + 1, i)
            visited[i] = false // 위 dfs에서 return 조건을 만족하지 못하면 실행
        }
    }
}

dfs("", 0, 1)


/*

 * visited 배열의 데이터 흐름 (n = 4, m = 2 일 때)
     [false, false, false, false, false]
     [false, true, false, false, false]
     [false, true, true, false, false]
     1 2
     [false, true, false, true, false]
     1 3
     [false, true, false, false, true]
     1 4
     [false, false, true, false, false]
     [false, false, true, true, false]
     2 3
     [false, false, true, false, true]
     2 4
     [false, false, false, true, false]
     [false, false, false, true, true]
     3 4
     [false, false, false, false, true]
     
*/
