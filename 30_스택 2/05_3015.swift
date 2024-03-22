let n = Int(readLine() ?? "") ?? 0
var heights = (0..<n).map { _ in
    Int(readLine() ?? "") ?? 0
}

var stack: [(height: Int, cnt: Int)] = []
var count = 0

for i in 0..<n {
    let curHeight = heights[i]
    var cnt = 1
    
    while let last = stack.last, last.height <= curHeight {
        let top = last
        
        cnt += top.height == curHeight ? top.cnt : 0
        count += top.cnt
        stack.removeLast()
    }
    
    if !stack.isEmpty { count += 1 }
    stack.append((curHeight, cnt))
}

print(count)
