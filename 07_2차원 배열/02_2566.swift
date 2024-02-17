var max = 0, maxRow = 0, maxCol = 0

for i in 0..<9 {
    if let input = readLine() {
        let inputArray = input.split { $0 == " " }.map { Int($0) ?? 0 }
        if let maxValue = inputArray.max(),
            let maxColIndex = inputArray.firstIndex(of: maxValue),
            max < maxValue {
            max = maxValue
            maxRow = i
            maxCol = maxColIndex
        }
    }
}

print(max)
print(maxRow+1, maxCol+1)

/*
 
 * String 요소 접근 시 각 문자는 String.SubSequence 타입
 
*/
