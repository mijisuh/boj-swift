var resultX: Set<Int> = []
var resultY: Set<Int> = []

while let input = readLine() {
    let inputArray = input.split { $0 == " " }
    if let x = Int(inputArray[0]), let y = Int(inputArray[1]) {
        // 3개의 점 중 각 x, y가 중복이 아닌 좌표 값 찾기
        if resultX.contains(x) {
            resultX.remove(x)
        } else {
            resultX.insert(x)
        }
        
        if resultY.contains(y) {
            resultY.remove(y)
        } else {
            resultY.insert(y)
        }
    }
}

print(resultX.first!, resultY.first!)
