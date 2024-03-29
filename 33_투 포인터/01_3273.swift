let n = Int(readLine() ?? "") ?? 0
let array = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }.sorted()
let x = Int(readLine() ?? "") ?? 0

var left = 0, right = n - 1
var count = 0

while left < right {
    let sum = array[left] + array[right]
    if sum == x {
        count += 1
        left += 1
        right -= 1
    } else if sum < x {
        left += 1
    } else {
        right -= 1
    }
}

print(count)
