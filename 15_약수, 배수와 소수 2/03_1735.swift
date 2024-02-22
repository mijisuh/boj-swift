// 방법 1) 분수의 합 그냥 구하기
func getGCD(_ a: Int, _ b: Int) -> Int {
    return a % b == 0 ? b : getGCD(b, a % b)
}

let inputArray1 = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let inputArray2 = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }

// 두 분수의 합 계산 후 약분(최대공약수로 나누기)
let sumA = inputArray1[0] * inputArray2[1] + inputArray2[0] * inputArray1[1]
let sumB = inputArray1[1] * inputArray2[1]
let gcd = getGCD(sumA, sumB)

print(sumA / gcd, sumB / gcd)

// 방법 2) 분수의 합을 분모들의 최대공배수로 구하기
func getGCD(_ a: Int, _ b: Int) -> Int {
    return a % b == 0 ? b : getGCD(b, a % b)
}

func getLCM(_ a: Int, _ b: Int) -> Int {
    return a * b / getGCD(a, b)
}

let inputArray1 = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let inputArray2 = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }

let lcm = getLCM(inputArray1[1], inputArray2[1])
let sumA = inputArray1[0] * (lcm / inputArray1[1]) + inputArray2[0] * (lcm / inputArray2[1])
let sumB = lcm
let gcd = getGCD(sumA, sumB)

print(sumA / gcd, sumB / gcd)
