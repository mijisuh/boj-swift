let n = Int(readLine() ?? "") ?? 0
var count = 0
var nicknames: Set<String> = []
while let input = readLine() {
    if input == "ENTER" {
        count += nicknames.count
        nicknames.removeAll()
    } else {
        nicknames.insert(input)
    }
}
count += nicknames.count
print(count)
