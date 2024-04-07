func find(_ a: Int) -> Int {
    if parent[a] == a { return a }
    parent[a] = find(parent[a])
    return parent[a]
}

func merge(_ a: Int, _ b: Int) {
    let parentA = find(a)
    let parentB = find(b)
    parent[parentB] = parentA
}

func isCycle(_ a: Int, _ b: Int) -> Bool {
    return find(a) == find(b)
}

let nm = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (n, m) = (nm[0], nm[1])

var parent = [Int](0...n)
var answer = 0

for i in 1...m {
    let ab = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
    let (a, b) = (ab[0], ab[1])

    if isCycle(a, b) { // 합칠 때 두 노드의 부모가 같으면 사이클
        answer = i
        break
    }

    merge(a, b)
}

print(answer)
