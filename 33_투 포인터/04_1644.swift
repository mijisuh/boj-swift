func getPrimes(_ n: Int) -> [Int] { // 에라토스테네스의 체
    if n < 2 { return [] }
    
    var isPrime = [Bool](repeating: true, count: n + 1)
    isPrime[0] = false
    isPrime[1] = false

    var i = 2
    while i * i <= n {
        if isPrime[i] {
            var multiple = i * i // 2, 3, ... 의 배수
            while multiple <= n {
                isPrime[multiple] = false // 배수이므로 소수가 아님
                multiple += i
            }
        }

        i += 1
    }
    
    return isPrime.enumerated().filter { $0.element }.map { $0.offset } // 값이 1인 경우 그 인덱스
}

let n = Int(readLine() ?? "") ?? 0

let primes = getPrimes(n)

var right = 0
var psum = 0
var count = 0

for left in 0..<primes.count {
    while psum < n, right < primes.count {
        psum += primes[right]
        right += 1
    }

    if psum == n { count += 1 }

    psum -= primes[left]
}

print(count)
