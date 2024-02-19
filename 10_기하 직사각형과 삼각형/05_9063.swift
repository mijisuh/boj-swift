var xMin = 10000
var xMax = -10000
var yMin = 10000
var yMax = -10000

if let _ = readLine() {
    while let input = readLine() {
        let inputArray = input.split { $0 == " " }
        if let x = Int(inputArray[0]), let y = Int(inputArray[1]) {
            xMin = min(xMin, x)
            xMax = max(xMax, x)
            yMin = min(yMin, y)
            yMax = max(yMax, y)
        }
    }
}

print((xMax - xMin) * (yMax - yMin))
