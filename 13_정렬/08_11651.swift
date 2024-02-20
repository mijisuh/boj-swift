var points: [(x: Int, y: Int)] = []

if let inputN = readLine() {
    if let n = Int(inputN) {
        for _ in 0..<n {
            if let inputPoint = readLine() {
                let point = inputPoint.split { $0 == " " }.map { Int($0) ?? 0 }
                points.append((x: point[0], y: point[1]))
            }
        }
        
        points.sort { ($0.y, $0.x) < ($1.y, $1.x) } // y 먼저 비교 후 x 비교
        
        points.forEach {
            print($0.x, $0.y)
        }
    }
}
