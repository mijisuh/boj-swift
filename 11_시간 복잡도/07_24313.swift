if let inputA = readLine(), let inputC = readLine(), let inputN = readLine() {
    let inputArray = inputA.split { $0 == " " }
    if let a1 = Int(inputArray[0]), let a0 = Int(inputArray[1]),
        let c = Int(inputC), let n0 = Int(inputN) {
            let fn = a1 * n0 + a0
            let gn = n0
            print(fn <= c * gn && a1 <= c ? "1" : "0")
    }
}

/*

 f(n) ≤ c * g(n)만 비교하면 안되고
 f(n) = a1 * n + a0 에서 a0이 음수인 경우도 생각해줘야 함
 
 a1 * n + a0 < c * n
 (a1 - c) * n + a0 < 0 에서,
 만약 a0 < 0 일 경우, (a1 - c)가 0 이거나 음수여야 함! → a1 ≤ c
 
*/
