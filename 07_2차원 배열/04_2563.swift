if let inputN = readLine() {
    if let n = Int(inputN) {
        var posArray = Array(repeating: Array(repeating: 0, count: 100), count: 100)
        var count = 0
        while let inputPos = readLine() {
            let inputPosArray = inputPos.split { $0 == " " }
            if let x = Int(inputPosArray[0]), let y = Int(inputPosArray[1]) {
                for i in x..<x+10 {
                    for j in y..<y+10{
                        if posArray[i][j] == 0 {
                            posArray[i][j] = 1
                            count += 1
                        }
                    }
                }
            }
            
        }
        
        print(count)
    }
}

/*

 * 도화지를 픽셀 단위로 생각하자! → 중복된 면적을 생각할 필요가 없음
 
*/
