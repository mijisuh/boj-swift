let nk = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0}
let (n, k) = (nk[0], nk[1])

var visited = [Int](repeating: -1, count: 100_001)
visited[n] = 0

var queue = [n]
var index = 0

while queue.count > index {
    let current = queue[index]

    if current == k { break }

    for dx in [-1, 1, current] {
        let next = current + dx
        if 0...100_000 ~= next && visited[next] == -1 {
            visited[next] = current // 이전 경로 저장
            queue.append(next)
        }
    }

    index += 1
}

print(visited)

var route: [Int] = []
var i = k

while i != n {
    route.append(i)
    i = visited[i] // 이전 경로로 이동
}

route.append(n)

print(route.count - 1)
print(route.reversed().map { String($0) }.joined(separator: " "))
