let n = Int(readLine() ?? "") ?? 0
var meetings: [(from: Int, to: Int)] = []

while let input = readLine() {
    let inputs = input.split { $0 == " " }.map { Int($0) ?? 0 }
    meetings.append((from: inputs[0], to: inputs[1]))
}

meetings.sort { ($0.to, $0.from) < ($1.to, $1.from) } // 종료 시간 기준 정렬 -> 시작 시간 기준 정렬

var count = 0
var current = meetings[0].from

for meeting in meetings {
    if meeting.from >= current { // 확정된 회의의 종료 시간과 후보가 되는 회의의 시작 시간 비교
        current = meeting.to
        count += 1
    }
}

print(count)
