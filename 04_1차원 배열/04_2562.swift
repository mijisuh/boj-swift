var index = -1
var max = -1

for i in 1...9 {
    let input = Int(readLine()!)!
    
    if max < input {
        index = i
        max = input
    }
}

print(max)
print(index)