import Foundation

final class FileIO { // 시간 초과때문에 빠른 입출력 사용해야 함
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
            && now != 32 && now != 0 {
                str += String(bytes: [now], encoding: .ascii)!
                now = read()
        }

        return str
    }
}

let file = FileIO()
let n = file.readInt()

var nums = [Int](repeating: 0, count: 10001)
for _ in 0..<n {
    let n = file.readInt()
    nums[n] += 1
}

var answer = ""
for i in 1...10000 {
    answer += String(repeating:"\(i)\n", count: nums[i])
}
print(answer)

/*
 
 [Counting Sort] → O(n + k)
 1. 정렬할 배열의 값을 인덱스로 가지는 Counting 배열 생성
 2. 정렬할 배열을 순회하면서 Counting 배열의 값에 해당 인덱스 값(정렬할 배열의 값)이 등장하는 빈도수를 저장 → 중복이 있는 배열 정렬 가능
 3. Counting 배열을 순회하면서 값이 0보다 큰 경우 값의 크기만큼 해당 인덱스를 출력
 
*/
