import Foundation

let n = Int(readLine() ?? "") ?? 0
var inputs: [Int] = []
var dict: [Int: Int] = [:]
var sum = 0

while let input = Int(readLine() ?? "") {
    inputs.append(input)
        
    // if let nums = dic[input] {
    //     dic[input] = nums + 1
    // } else {
    //     dic[input] = 1
    // }
    dict[input, default: 0] += 1 // default 값을 사용해서 위의 식 축약 가능

    sum += input
}

inputs.sort()

let modes = dict.filter { $0.1 == dict.values.max()}.sorted { $0.0 < $1.0 } // 최빈값 배열

print(lround(Double(sum) / Double(n)))
print(inputs[n / 2])
print(modes.count == 1 ? modes[0].0 : modes[1].0)
print(inputs[n - 1] - inputs[0])


/*

 [lround() 함수]
 - Swift 표준 라이브러리에서 제공되는 함수로, 부동 소수점 숫자를 가장 가까운 정수로 반올림하는데 사용함
 - ”long round”의 약어이며, Double 또는 Float과 같은 부동 소수점 숫자를 Int로 반올림함
    - lround(): Double → Int로 반올림
    - lroundf(): Float → Int로 반올림

 cf)
 - 단순히 소수점 아래를 버리고 정수 부분만 얻고자 한다면 → Int 형 변환
 - 반올림하고 Int로 형변환 하지 않으려면 → round()
 
*/
