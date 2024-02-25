func factorial(_ n: Int) -> Int {
    if n <= 1 { return 1 }
    return n * factorial(n - 1)
}

let n = Int(readLine() ?? "") ?? 0
print(factorial(n))
