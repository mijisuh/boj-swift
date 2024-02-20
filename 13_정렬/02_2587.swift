var array: [Int] = []
while let input = readLine() {
    if let n = Int(input) {
        array.append(n)
    }
}

let average = array.reduce(0, +) / 5
let median = array.sorted()[2]

print(average)
print(median)
