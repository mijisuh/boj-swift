// 방법 1) 이해가 쉬운 풀이
let input = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let n = input[0], m = input[1]
var visited = [Bool](repeating: false, count: n + 1)

func dfs(_ nums: [Int], _ count: Int) {
    if count == m {
        print(nums.map { String($0) }.joined(separator: " "))
        return
    }

    for i in 1...n {
        if !visited[i] {
            visited[i] = true
            dfs(nums + [i], count + 1)
            visited[i] = false // 위 dfs에서 return 조건을 만족하지 못하면 실행
        }
    }
}

dfs([], 0)

// 방법 2) 중간 결과들을 [Int]가 아닌 String으로 저장
// 시간: 108 ms(방법 1) -> 56 ms
let input = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let n = input[0], m = input[1]
var visited = [Bool](repeating: false, count: n + 1)

func dfs(_ nums: String, _ count: Int) {
    if count == m {
        print(nums)
        return
    }

    for i in 1...n {
        if !visited[i] {
            visited[i] = true
            dfs(nums + "\(i) ", count + 1)
            visited[i] = false // 위 dfs에서 return 조건을 만족하지 못하면 실행
        }
    }
}

dfs("", 0)


/*

 [백트래킹]
 : DFS로 깊이 탐색을 진행하면서 각 루트에 대해 조건에 부합하는 지 체크(Promising)하고 조건에 만족하지 않으면 더이상 DFS로 깊이 탐색을 진행하지 않고(Pruning) 다른 경우를 체크
    - Promising: 해당 루트가 조건에 맞는지를 검사하는 기법
    - Pruning: 조건에 맞지 않으면 포기하고 다른 루트로 바로 돌아서서 탐색의 시간을 절약하는 기법
 
 ** visited 배열의 데이터 흐름 (n = 4, m = 2 일 때)
       [0]    [1]    [2]    [3]    [4]
     [false, false, false, false, false]
     [false, true, false, false, false]
     [false, true, true, false, false]
     1 2
     [false, true, false, true, false]
     1 3
     [false, true, false, false, true]
     1 4
     [false, false, true, false, false]
     [false, true, true, false, false]
     2 1
     [false, false, true, true, false]
     2 3
     [false, false, true, false, true]
     2 4
     [false, false, false, true, false]
     [false, true, false, true, false]
     3 1
     [false, false, true, true, false]
     3 2
     [false, false, false, true, true]
     3 4
     [false, false, false, false, true]
     [false, true, false, false, true]
     4 1
     [false, false, true, false, true]
     4 2
     [false, false, false, true, true]
     4 3
 
*/
