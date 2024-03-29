let ns = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (n, s) = (ns[0], ns[1])
let array = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }

var right = 0
var psum = 0
var answer = n + 1

for left in 0..<n { // left를 포함한다고 가정
    while psum < s && right < n { // 부분합 계산
        psum += array[right]
        right += 1
    }
    if psum >= s { answer = min(answer, right - left) }
    psum -= array[left] // left 포함 X
}

print(answer == n + 1 ? 0 : answer)
