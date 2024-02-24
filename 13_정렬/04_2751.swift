// MARK: 방법 1) 그냥 sorted() 사용
var array: [Int] = []
if let _ = readLine() {
    while let input = readLine() {
        if let n = Int(input) {
            array.append(n)
        }
    }
    array.sorted().forEach {
        print($0)
    }
}

// MARK: 방법 2) 배열을 만들어서 배열의 인덱스를 정렬해야 하는 요소라고 생각
var nums = [Int](repeating: 0, count: 2000001)

if let _ = readLine() {
    while let input = readLine() {
        if let n = Int(input) {
            nums[n + 1000000] = 1
        }
    }
    
    for i in 0..<nums.count {
        if nums[i] == 1 {
            print(i - 1000000)
        }
    }
}

/*
 
 Swift의 sort는 Timsort로 구현되어 있음 → O(nlogn)
 : Timsort란 Hybrid Stable Sorting Algorithm으로 Merge sort와 Insertion sort가 섞여 있음
 
 [Stable Sort(안정 정럴)]
 - 중복된 값을 입력 순서와 동일하게 정렬하는 정렬 알고리즘의 특성
 ex) 삽입 정렬, 뱡합 정렬, 버블 정렬

 [Unstable Sort(불안정 정렬)]
 - 중복된 값을 입력 순서와 동일하게 정렬하는 것을 보장하지 않는 알고리즘
 ex) 퀵 정렬, 선택 정렬, 계수 정렬
 
*/
