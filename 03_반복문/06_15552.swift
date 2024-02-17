import Foundation // FileHandle 사용

final class FileIO {
    private let buffer: [UInt8] // 입력을 바이트 배열로 변환해서 저장
    private var index: Int = 0 // 현재 읽고 있는 바이트의 위치
    
    /*
    command-line에서 실행되므로 표준입력이 키보드입력으로 정해짐
    
    키보드 입력을 파일로 간주할 수 있는 이유는
    유닉스 계열의 운영체제에서 하드웨어를 파일로 추상화해서 사용하기 때문
    */
    init(fileHandler: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandler.readToEnd()! + [UInt8(0)])
        // 현재 파일(= 커맨드 라인 입력)을 끝까지 한번에 읽어와서 buffer에 저장
        // ** 마지막에 0을 추가해서 buffer의 끝 부분임을 알림
    }
    
    // MARK: 1 byte를 읽어오는 함수
    @inline(__always)
    private func read() -> UInt8 {
        defer { index += 1 } // 읽고 난 후 index 값 증가
        
        return buffer[index]
    }
    
    // MARK: 연속된 byte 값을 Int로 변환해서 읽어오는 함수
    @inline(__always)
    func readInt() -> Int {
        var sum = 0 // 결과 저장
        var now = read() // 현재 index의 바이트 값
        var isPositive = true // 부호 저장
        
        while now == 10 || now == 32 { now = read() } // 공백(" ")과 줄바꿈("\n") 무시
        
        if now == 45 { // 음수("-") 처리
            isPositive.toggle()
            now = read()
        }
        
        while now >= 48, now <= 57 { // 0 ~ 9
            sum = sum * 10 + Int(now - 48) // 자릿수 적용
            now = read() // 다음 바이트 읽기
        }
        
        return sum * (isPositive ? 1 : -1) // 부호까지 적용해서 계산
    }
    
    // MARK: 연속된 byte 값을 String으로 변환해서 읽어오는 함수
    @inline(__always) func readString() -> String {
        var now = read()
        
        while now == 10 || now == 32 { now = read() }
        
        // 공백이나 줄바꿈이 아니라면, 그 index를 기록(문자열의 시작점)
        // -1를 해주는 이유는 index 값은 앞으로 읽은 다음 바이트를 가리키는 것이므로
        let beginIndex = index - 1
        
        // 공백(32) or 줄바꿈(10) or 파일의 끝(0)이 나오기 전까지 read
        while now != 10, now != 32, now != 0 { now = read() }
        
        // while 문을 벗어나면 시작 index부터 문자열의 index까지 Array를 잘라서 String으로 형 변환
        return String(bytes: Array(buffer[beginIndex..<(index - 1)]), encoding: .ascii)!
    }
    
    // MARK: 연속된 byte 값을 읽어오는 함수
    @inline(__always)
    func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()
        
        while now == 10 || now == 32 { now = read() }
        let beginIndex = index - 1
        
        while now != 10, now != 32, now != 0 { now = read() }
        
        return Array(buffer[beginIndex..<(index - 1)])
    }
}

let fileIO = FileIO()

let n = fileIO.readInt()

for _ in 0..<n {
    // 한 줄 통으로 읽는 것이 아니므로 각각 1번씩 실행
    let a = fileIO.readInt()
    let b = fileIO.readInt()
    print(a + b)
}


/*

[빠른 입출력]
: 기본 readLine()의 속도가 느려 백준에서 시간초과시 해결 가능

[FileHandler 객체]
- 파일의 데이터에 접근할 수 있게 함
- FileHandler 인스턴스를 만든다는 것은 특정 file descriptor의 소유권을 가진다는 의미
(file descriptor: 리눅스 혹은 유닉스 운영체제에서 프로세스가 특정 파일에 접근할 때 사용하는 추상적인 값(일종의 포인터)이며 운영체제에 의해서 관리됨)

*/

/*

[inline 함수]
- @inline은 인라인 함수 최적화를 지시하는 특별한 어트리뷰트
- 인라인 최적화는 함수를 호출하는 위치에 실제 함수 코드의 복사본을 대체하여 함수 호출 오버헤드를 줄이는 기법
- 함수가 작거나 호출 횟수가 빈번한 경우에 유용

*/