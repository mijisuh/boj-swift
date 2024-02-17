// 방법 1) Array로 만들어서 확인
if let wordInput = readLine() {
    let wordArray = Array(wordInput)
    print(wordArray.count)
}

// 방법 2) 문자열 길이 계산
if let wordInput = readLine() {
    print(wordInput.count)
}
