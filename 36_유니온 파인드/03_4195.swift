func find(_ a: String, _ parent: inout [String: String]) -> String {
    if parent[a] == a { return a }
    parent[a] = find(parent[a]!, &parent)
    return parent[a]!
}

func merge(_ a: String, _ b: String, _ parent: inout [String: String], _ networkSize: inout [String: Int]) {
    let parentA = find(a, &parent)
    let parentB = find(b, &parent)

    if parentA == parentB { return } // 안해주면 메모리 초과!
    
    parent[parentB] = parentA
    networkSize[parentA]! += networkSize[parentB]!
    networkSize[parentB] = networkSize[parentA]
}

let testCase = Int(readLine() ?? "") ?? 0
for _ in 0..<testCase {
    let f = Int(readLine() ?? "") ?? 0
    var parent: [String: String] = [:]
    var networkSize: [String: Int] = [:] // 해당 네트워크에 포함되는 친구 개수(이런 식으로 안하고 나중에 반복문으로 개수를 계산하면 시간 초과)

    var relations: [(String, String)] = []
    for _ in 0..<f {
        let ab = (readLine() ?? "").split { $0 == " " }.map { String($0) }
        relations.append((ab[0], ab[1]))
    }
    
    // 초기화
    for (a, b) in relations {
        parent[a] = a
        networkSize[a] = 1
        
        parent[b] = b
        networkSize[b] = 1
    }
    
    for (a, b) in relations {
        merge(a, b, &parent, &networkSize)
        
        let parentA = find(a, &parent)
        print(networkSize[parentA]!)
    }
}
