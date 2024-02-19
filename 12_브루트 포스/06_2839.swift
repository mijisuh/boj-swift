if let input = readLine() {
    if let n = Int(input) {
        var minCount = n
        for i in 0...(n / 5) {
            for j in 0...(n / 3) {
                var weight = n
                if i == 0 && j == 0 { continue }
                
                weight -= i * 5 + j * 3
                
                if weight == 0 {
                    minCount = min(i + j, minCount)
                }
            }
        }
        minCount == n ? print(-1) : print(minCount)
    }
}


/*

 * 봉지로 배달할 수 있는 모든 경우의 수를 구해서 봉지의 개수가 제일 작은 경우 찾기
 1. 봉지 개수의 경우의 수
    - 5킬로그램 봉지로 배달하는 경우, 봉지의 개수 → 0..<n/5
    - 3킬로그램 봉지로 배달하는 경우, 봉지의 개수 → 0..<n/3
 2. 각 경우의 수에서 설탕의 무게가 n이 되는 경우에 각 봉지의 개수의 합 계산
 3. 2번까지 만족하는 경우의 수 중 봉지의 개수의 합의 최솟값 계산
 
*/
