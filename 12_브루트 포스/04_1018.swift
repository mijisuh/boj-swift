if let input = readLine() {
    let inputArray = input.split { $0 == " " }
    
    var boards: [[Character]] = []
    while let inputBoard = readLine() {
        boards.append(Array(inputBoard))
    }
    
    if let n = Int(inputArray[0]), let m = Int(inputArray[1]) {
        var result = 64
        
        for i in 0...(n - 8) {
            for j in 0...(m - 8) {
                var result1 = 0 // WB 패턴
                var result2 = 0 // BW 패턴
                
                for row in i..<(i + 8) {
                    for col in j..<(j + 8) {
                        if (row - i + col - j) % 2 == 0 { // 짝수번째
                            if boards[row][col] == "B" {
                                result1 += 1 // WB에서 뒤(짝수 순서)가 B이므로 바꿔줘야 함
                            } else {
                                result2 += 1 // WB에서 뒤(짝수 순서)가 W이므로 바꿔줘야 함
                            }
                        } else {
                            if boards[row][col] == "W" { // 홀수번째
                                result1 += 1 // WB에서 앞(홀수 순서)이 B이므로 바꿔줘야 함
                            } else {
                                result2 += 1 // BW에서 앞(홀수 순서)이 W이므로 바꿔줘야 함
                            }
                        }
                    }
                }
                
                result = min(result1, result2, result)
            }
        }
        
        print(result)
    }
}


/*

 체스판은 BWBW..로 반복되거나 WBWB..로 반복되는 패턴이기 때문에
 두개의 패턴에서 바꿔줘야 하는 칸의 개수를 각각 계산하고 비교해서 더 작은 개수를 출력한다.
 
*/
