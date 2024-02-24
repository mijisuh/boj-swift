// MARK: 방법 1) Tuple 정렬 시 우선순위 지정
var points: [(x: Int, y: Int)] = []

if let inputN = readLine() {
    if let n = Int(inputN) {
        for _ in 0..<n {
            if let inputPoint = readLine() {
                let point = inputPoint.split { $0 == " " }.map { Int($0) ?? 0 }
                points.append((x: point[0], y: point[1]))
            }
        }
        
        points.sort { ($0.x, $0.y) < ($1.x, $1.y) }
        
        points.forEach {
            print($0.x, $0.y)
        }
    }
}

// MARK: 방법 2) Tuple 자동 정렬
var points: [(x: Int, y: Int)] = []

if let inputN = readLine() {
    if let n = Int(inputN) {
        for _ in 0..<n {
            if let inputPoint = readLine() {
                let point = inputPoint.split { $0 == " " }.map { Int($0) ?? 0 }
                points.append((x: point[0], y: point[1]))
            }
        }
        
        points.sort(by: <)
        
        points.forEach {
            print($0.x, $0.y)
        }
    }
}
