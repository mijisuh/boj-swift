func dfs(_ from: Int, _ to: Int, _ array: inout [Int], _ sum: Int) { // 가방에 넣을 수 있는 경우의 수
    if sum > c { return }

    if from == to {
        array.append(sum)
        return
    }

    dfs(from + 1, to, &array, sum)
    dfs(from + 1, to, &array, sum + weights[from])
}

func upperbound(_ array: [Int], _ target: Int) -> Int { // target보다 한 칸 큰 값의 인덱스 반환
    var start = 0
    var end = array.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        
        if array[mid] > target {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
    return start
}

let nc = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (n, c) = (nc[0], nc[1])

let weights = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }

var leftArray: [Int] = [], rightArray: [Int] = []

// 연산 수가 2^n -> 2 * 2^(2/n)로 줄어듬
dfs(0, n / 2, &leftArray, 0)
dfs(n / 2, n, &rightArray, 0)

leftArray.sort() // 이진탐색

var answer = 0
for rightValue in rightArray {
    answer += upperbound(leftArray, c - rightValue) // leftArray에서 c - rightValue보다 작은 수들의 개수
}
print(answer)
