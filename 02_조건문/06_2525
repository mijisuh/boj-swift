let currentTime = readLine()!.split(separator: " ").map { Int($0)! }
let requiredMinutes = Int(readLine()!)!
let currentTimeMinutes = currentTime[0] * 60 + currentTime[1] + requiredMinutes

print(currentTimeMinutes / 60 % 24, currentTimeMinutes % 60)


/*

(시, 분) → 분 → (시, 분)
더하기이기 때문에 가능! (빼줘야 하는 경우 음수가 될 수 있으므로 더 생각해야 함)

*/