var angles: Set<Int> = []
var sum = 0

while let input = readLine() {
    if let angle = Int(input) {
        angles.insert(angle)
        sum += angle
    }
}

if sum == 180 {
    if angles.count == 1 {
        print("Equilateral")
    } else if angles.count == 2 {
        print("Isosceles")
    } else {
        print("Scalene")
    }
} else {
    print("Error")
}
