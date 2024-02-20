// 방법 1) Set, Dictionary 이용
// 1. 입력 배열을 이용해 중복이 없는 배열(Set) 생성
// 2. 중복이 없는 배열을 정렬
// 3. 중복이 없는 정렬된 배열 -> [값: 인덱스] 형태의 딕셔너리 타입으로 저장
// 4. 입력 배열의 값을 딕셔너리의 키로 이용해 해당 값의 인덱스 출력
if let _ = readLine() {
    if let input = readLine() {
        var points: [Int: Int] = [:]
        let array = input.split { $0 == " " }.map { Int($0) ?? 0 }
        let setArray = Set(array).sorted()
        
        for (index, num) in setArray.enumerated() {
            points[num] = index
        }

        for num in array {
            if let index = points[num] {
                print(index, terminator: " ")
            }
        }
    }
}

// 방법 2) Dictionary 이용
// 1. 입력 배열을 정렬한 배열을 순회하면서 중복이 아닐 경우 딕셔너리 값을 증가시킴
// 2. 오름차 순으로 값 증가되는 형태
// 3. 입력 배열 순서대로 딕셔너리 출력
if let _ = readLine() {
    if let input = readLine() {
        var points: [Int: Int] = [:]
        let array = input.split { $0 == " " }.map { Int($0) ?? 0 }
        var index = 0
        
        for num in array.sorted() {
            if points[num] == nil {
                points[num] = index
                index += 1
            }
        }

        for num in array {
            if let index = points[num] {
                print(index, terminator: " ")
            }
        }

                // for문 없이 출력 시 시간이 1608 ms -> 984 ms 단축
                // print(array.map { String(points[$0] ?? 0) }.joined(separator: " "))
    }
}
