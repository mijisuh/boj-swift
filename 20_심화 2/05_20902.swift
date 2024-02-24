// MARK: 방법 1) 단어의 빈도수만 저장
let inputs = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let n = inputs[0], m = inputs[1]
var dict: [String: Int] = [:]

while let input = readLine() {
    if input.count >= m {
        dict[input, default: 0] += 1
    }
}

let resultArray = dict.sorted {
    // 1 순위: 단어의 빈도수로 내림차 순(같으면 다음 우선 순위 단계로)
    if $0.1 != $1.1 {
        return $0.1 > $1.1
    }
    // if $0.1 > $1.1 {
    //     return true
    // } else if $0.1 < $1.1 {
    //     return false
    // }

    // 2 순위: 단어의 길이로 내림차 순
    if $0.0.count != $1.0.count {
        return $0.0.count > $1.0.count
    }
    // if $0.0.count > $1.0.count {
    //     return true
    // } else if $0.0.count < $1.0.count {
    //     return false
    // }

    // 3 순위: 알파벳 사전 순
    return $0.0 < $1.0
}.map { $0.0 }

print(resultArray.joined(separator: "\n"))

// MARK: 방법 2) 단어의 빈도수, 단어의 길이 저장
// 정렬할 때마다 단어의 길이를 계산(count)해주지 않아도 돼서 시간이 단축됨
// 시간: 988 ms(방법 1) -> 148 ms
let inputs = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let n = inputs[0], m = inputs[1]
var dict: [String: (frequency: Int, count: Int)] = [:]

while let input = readLine() {
    if input.count >= m {
        dict[input, default: (0, 0)].frequency += 1
        dict[input, default: (0, 0)].count = input.count
    }
}

let resultArray = dict.sorted {
    // 1 순위: 단어의 빈도수로 내림차 순
    if $0.value.frequency != $1.value.frequency {
        return $0.value.frequency > $1.value.frequency
    }

    // 2 순위: 단어의 길이로 내림차 순
    if $0.value.count != $1.value.count {
        return $0.value.count > $1.value.count
    }

    // 3 순위: 알파벳 사전 순
    return $0.key < $1.key
}.map { $0.0 }

print(resultArray.joined(separator: "\n"))
