let nm = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let n = nm[0], m = nm[1]
let array = (readLine() ?? "").split { $0 == " "}.map { Int($0) ?? 0}

var psum = [0] + array
var counts = [Int](repeating: 0, count: m)
var result = 0

for i in 1...n {
    psum[i] += psum[i - 1]
    if psum[i] % m == 0 { result += 1 } // 1~i번째 값의 누적합이 m으로 나누어 떨어지는 경우
    counts[psum[i] % m] += 1 // i 번째 누적합을 m으로 나눈 나머지 개수(인덱스: 나머지)
}

for i in 0..<m { // 나머지가 같은 것들끼리 2개씩 뽑는 경우의 수 계산
    result += (counts[i] * (counts[i] - 1)) / 2 // counts[i] 중 2개를 뽑는 조합의 경우의 수
}

print(result)

/*
 
 * 일일히 누적합을 m으로 나누는 방법은 이중 for문을 사용해 시간 초과
 
 * (i, j) 구간의 합이 m으로 나누어 떨어지는지 확인하는 방법 → 모듈러 연산 활용
    (psum[j] - psum[i - 1]) % m == 0
    (psum[j] % m) - (psum[i - 1] % m) == 0
    psum[j] % m == psum[i - 1] % m
    → 누적합을 m으로 나눴을 때 나머지가 같은 경우
 
*/
