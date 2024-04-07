func find(_ n: Int) -> Int { // 부모 노드 찾기
    if parent[n] == n {
        return n
    }
    parent[n] = find(parent[n])
    return parent[n]
}

func merge(_ a: Int, _ b: Int) {
    // 부모 노드 찾기
    let parentA = find(a)
    let parentB = find(b)
    
    // 부모 노드 갱신
    // 둘 중 하나의 부모 노드를 다른 노드의 자식 노드로 넣어줌
    parent[parentB] = parentA
}

func isUnion(_ a: Int, _ b: Int) -> Bool {
    return find(a) == find(b)
}

let nm = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (n, m) = (nm[0], nm[1])

var parent = [Int](0...n) // parent 배열 생성: 각 인덱스의 부모 노드 저장

while let input = readLine() {
    let inputs = input.split { $0 == " " }.map { Int($0) ?? 0 }
    let (op, a, b) = (inputs[0], inputs[1], inputs[2])

    if op == 0 {
        merge(a, b)
    } else {
        print(isUnion(a, b) ? "YES" : "NO")
    }
}


/*
 
 <유니온 파인드(Union-Find)>
 - 두 노드가 서로 같은 그래프에 속하는지 판별하는 알고리즘
 - 서로소 집합, Disjoint-Set 알고리즘
 - 2가지 연산 작업(부모 노드를 찾는 Find 연산, 두 노드를 합치는 Union 연산)
 
*/
