// 방법 1) 이해가 쉬운 코드
let n = Int(readLine() ?? "") ?? 0
var dpCount = 0

func recursiveFibo(_ n: Int) -> Int {
    if n == 1 || n == 2 {
        return 1
    }
    return recursiveFibo(n - 1) + recursiveFibo(n - 2)
}

func dpFibo(_ n: Int) -> Int {
    var cache = [0, 1, 1]
    for i in 3...n {
        dpCount += 1
        cache.append(cache[i - 1] + cache[i - 2])
    }
    return cache[n]
}

let recursiveCount = dpFibo(n)
print(recursiveCount, dpCount)

// 방법 2) 최적화 코드
let n = Int(readLine()!)!
var dp = [0, 1, 1]

for i in 3...n {
    dp.append(dp[i - 2] + dp[i - 1])
}
print(dp[n], n - 2)
