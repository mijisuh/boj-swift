// import Foundation
// let limit = Int(pow(2.0, 31.0)) // 32비트 환경

let nk = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (n, k) = (nk[0], nk[1])
var coins: [Int] = []
while let input = Int(readLine() ?? "") {
    coins.append(input)
}

var dp = [Int](repeating: 0, count: k + 1) // total 경우의 수 개수 배열
dp[0] = 1 // dp[coin]을 1로 만듬
for coin in coins {
    if coin > k { continue } // k보다 큰 돈으로 합이 k원인 경우를 만들 수 없음
    for i in coin...k {
        // 배열의 원소가 swift에서 다룰 수 있는 Int형의 최대 값보다 커질 경우, 오버플로우 런타임 에러가 발생
        // dp[i] = dp[i] > limit ? 0 : dp[i]
        dp[i] = dp[i] &+ dp[i - coin] // 오버플로우 연산자 &+
    }
}

/*
   1 2 3 4 5 6 7 8 9 10
1  1 1 1 1 1 1 1 1 1 1  : (1)로 조합하는 경우의 수
2  0 1 1 2 2 3 3 4 4 5  : (1 or 2)로 조합하는 경우의 수
5  0 0 0 0 1 1 1 2 3 4  : (1 or 2 or 3)으로 조합하는 경우의 수
+  1 2 2 3 4 5 5 7 8 10
*/

print(dp[k])
