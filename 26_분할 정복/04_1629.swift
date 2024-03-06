// 방법 1)
let inputs = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (a, b, c) = (inputs[0], inputs[1], inputs[2])

func dfs(_ b: Int) -> Int {
    if b == 1 {
        return a % c
    } else if b % 2 == 0 { // 지수가 짝수인 경우
        let tmp = dfs(b / 2)
        return tmp * tmp % c // (지수 / 2) 제곱 값을 2번 곱함
    } else { // 지수가 홀수인 경우
        return a * dfs(b - 1) % c // 지수 - 1
    }
}

print(dfs(b) % c)

// 방법 2)
let inputs = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (a, b, c) = (inputs[0], inputs[1], inputs[2])

func dfs(_ b: Int) -> Int {
    if b == 1 {
        return a % c
    } else  {
        let half = dfs(b / 2)
        if b % 2 == 0 { // 지수가 짝수인 경우
            return half * half % c // (지수 / 2)로 제곱한 것을 2번 곱함
        } else { // 지수가 홀수인 경우
            return half * half % c * a % c // (지수 / 2) 제곱 값을 2번 곱하고 a를 곱함(오버플로우 문제로 인해 곱하고 나누는 순서 중요)
        }
    }
}

print(dfs(b))
