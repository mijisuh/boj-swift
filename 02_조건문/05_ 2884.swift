let time = readLine()!.split(separator: " ").map { Int($0)! }
var hour = time[0]
var minute = time[1]

minute -= 45

if minute < 0 {
    minute = 60 + minute
    
    hour -= 1
    if hour < 0 {
        hour = 23
    }
}

print("\(hour) \(minute)")


/*

print(A, B) -> "A B"

*/