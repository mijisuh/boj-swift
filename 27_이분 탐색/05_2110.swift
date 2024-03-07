let nm = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let (n, m) = (nm[0], nm[1])
let house = (0..<n).map { _ in
    Int(readLine() ?? "") ?? 0
}.sorted()

var start = 1, end = house[n - 1] - house[0]
var mid: Int { (start + end) / 2 } // 인접한 두 집의 거리의 최대 거리

while start <= end {
    var frontHouse = house[0]
    var cnt = 1 // 공유기 설치 개수

    // mid 기준으로 house 리스트 돌면서 공유기 설치 가능한지 확인
    for i in 1..<n {
        let d = house[i] - frontHouse
        // 두 집 사이의 거리가 mid보다 커야 공유기 설치 가능
        if mid <= d {
            cnt += 1
            frontHouse = house[i]
        }
    }

    if cnt < m { // cnt를 늘려주기 위해 mid를 줄이자
        end = mid - 1
    } else { // cnt를 줄이기 위해 mid를 늘리자
        start = mid + 1
    }
}

print(mid)
