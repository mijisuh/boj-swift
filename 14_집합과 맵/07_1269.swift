let inputNM = (readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 }
let n = inputNM[0]
let m = inputNM[1]
let a = Set((readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 })
let b = Set((readLine() ?? "").split { $0 == " " }.map { Int($0) ?? 0 })

let count1 = a.filter { !b.contains($0) }.count
let count2 = b.filter { !a.contains($0) }.count

print(count1 + count2)
