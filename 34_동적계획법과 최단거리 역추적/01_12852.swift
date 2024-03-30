let n = Int(readLine() ?? "") ?? 0

var visited = [Int](repeating: 0, count: n + 1)

var queue: [(Int, String)] = [(n, "\(n) ")]
var index = 0

while queue.count > index {
    let (x, answer) = queue[index]

    if x == 1 {
        print(visited[1])
        print(answer)
        break
    }

    if x % 3 == 0, visited[x / 3] == 0 {
        visited[x / 3] = visited[x] + 1
        queue.append((x / 3, answer + "\(x / 3) "))
    }
    if x % 2 == 0, visited[x / 2] == 0 {
        visited[x / 2] = visited[x] + 1
        queue.append((x / 2, answer + "\(x / 2) "))
    }
    if visited[x - 1] == 0 {
        visited[x - 1] = visited[x] + 1
        queue.append((x - 1, answer + "\(x - 1) "))
    }

    index += 1
}
