let nk = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (n, k) = (nk[0], nk[1])

var visited = [Int](repeating: 0, count: 100_001)
var queue = [n]
var index = 0

if n == k {
    print(0)
} else if n > k { // -1 하는 방법만 가능
    print(n - k)
} else {
    while queue.count > index {
        let pos = queue[index]
        for i in [pos - 1, pos + 1, pos * 2] where (0...100_000) ~= i && visited[i] == 0 {
            visited[i] = visited[pos] + 1
            queue.append(i)
        }
        index += 1
    }
    
    print(visited[k])
}
