// MARK: 방법 1)
// 1. 각 수들의 1을 제외한 약수를 모두 구하고
// 2. 중복 없이 약수들을 담은 배열을 오름차순 정려
// 3. 배열의 개수가 짝수인 경우, 제일 작은 값과 제일 큰 값의 곱을 프린트 하고
// 4. 홀수인 경우, 가장 중간 값의 제곱을 프린트
let n = Int(readLine() ?? "") ?? 0
let inputs = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }

var divisors: [Int] = []
for i in 0..<n {
    for j in 2...inputs[i] {
        if inputs[i] % j == 0, !divisors.contains(j) {
            divisors.append(j)
        }
    }
}

divisors.sort()

let count = divisors.count
if count % 2 == 0 {
    print(divisors.first! * divisors.last!)
} else {
    print(divisors[count / 2] * divisors[count / 2])
}

// MARK: 방법 2) 그냥 가장 작은 값과 큰 값을 곱하면 됨
let n = Int(readLine() ?? "") ?? 0
let inputs = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
print(inputs.min()! * inputs.max()!)

/*
 
 TestCase 1)
 주어진 수를 정렬하면 2, 4 -> 8의 진짜 약수
 
 TestCase 2)
 주어진 수를 정렬하면 1, 2 -> 2의 진짜 약수
 
 TestCase 2)
 주어진 수를 정렬하면 2, 4, 7, 8, 14, 28, 56, 3307, 6614, 13228, 23149, 26456, 46298, 92596
 -> 2 * 92596 = 185,192의 진짜 약수
 
*/
