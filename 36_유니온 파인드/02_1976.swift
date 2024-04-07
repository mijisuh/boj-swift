func find(_ n: Int) -> Int {
    if parent[n] == n { return n }
    parent[n] = find(parent[n])
    return parent[n]
}

func merge(_ a: Int, _ b: Int) {
    let parentA = find(a)
    let parentB = find(b)
    parent[parentB] = parentA
}

let n = Int(readLine() ?? "") ?? 0 // 도시의 수
let m = Int(readLine() ?? "") ?? 0 // 여행 경로에 속한 도시의 수

var parent = [Int](0...n)

for i in 1...n {
    let inputs = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
    for j in 1...n where inputs[j - 1] == 1 {
        merge(i, j)
    }
}

let route = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 } // 여행 경로

// 같은 그래프에 있는지 확인 -> 부모 노드가 같은지 확인
let p = find(route[0])
var answer = "YES"
route.forEach {
    if find($0) != p {
        answer = "NO"
    }
}
print(answer)
