let n = Int(readLine() ?? "") ?? 0
let array = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }.sorted()

var left = 0, right = n - 1
var minSum = Int.max
var answer = (0, 0)

while left < right {
    let sum = array[left] + array[right]
    
    let absSum = abs(sum)
    if absSum < minSum {
        minSum = absSum
        answer = (array[left], array[right])
    }
    
    if sum < 0 {
        left += 1 // sum이 커짐
    } else {
        right -= 1 // sum이 작아짐
    }
}

print(answer.0, answer.1)
