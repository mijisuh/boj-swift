// MARK: 방법 1) 크기가 가장 큰 열을 구해서 사용
var array: [[Character]] = []

while let input = readLine() {
    array.append(Array(input))
}

let maxCount = array.reduce(0) { max($0, $1.count) }

var result = ""
for i in 0..<maxCount {
    for j in 0..<array.count {
        if array[j].count > i {
            result += String(array[j][i])
        }
    }
}

print(result)

// MARK: 방법 2) 미리 2차원 공간을 할당
var array = [[String]](repeating: [String](repeating: "", count: 15), count: 5)

for i in 0..<5 {
    if let input = readLine() {
        let inputArray = Array(input).map { String($0) }
        for j in 0..<inputArray.count {
            array[i][j] = inputArray[j]
        }
    }
}

var result = ""
for i in 0..<15 {
    for j in 0..<5 {
        result += array[j][i]
    }
}

print(result)


/*
 
 [2차원 배열에서 크기가 가장 큰 열의 크기 구하는 방법]
 -> reducea 활용
 let maxColumnCount = twoDArray.reduce(0) { max($0, $1.count) }
 
*/

/*

 * String → Array로 만들면 각 요소의 타입은 Character
 * let value = ””에서 value의 타입은 String
 
*/
