// 방법 1) 범위 계산
if let input = readLine() {
    if let x = Int(input) {
        var row = 1 // 1 2 3 4
        var front = 1 // 1 2 4 7
        
        while front + row <= x {
            front += row
            row += 1
        }
        
        var numerator = 0, var denominator = 0
        if row % 2 == 0 {
            numerator = x - front + 1
            denominator = row + 1 - numerator // 역순
        } else {
            denominator = x - front + 1
            numerator = row + 1 - denominator // 역순
        }

        print("\(numerator)/\(denominator)")
    }
}

// 방법 2) 등차수열을 잘 이용
if let input = readLine() {
    if let x = Int(input) {
        var remains = x
        var i = 1 // 공차가 1인 등차수열
        while remains > i {
            remains -= i
            i += 1
        }
        
        var numerator = 0
        var denominator = 0
        if i % 2 == 0 {
            numerator = remains
            denominator = i + 1 - numerator
        } else {
            denominator = remains
            numerator = i + 1 - denominator
        }

        print("\(numerator)/\(denominator)")
    }
}


/*

 1/1 -> [1]
 1/2 2/1 -> [2...3]
 3/1 2/2 1/3 -> [4...6]
 1/4 2/3 3/2 4/1 -> [7...10]
 5/1 4/2 3/3 2/4 1/5 -> [11..15]
 
*/
