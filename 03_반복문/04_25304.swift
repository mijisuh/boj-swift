let receiptPrice = Int(readLine()!)!
let nums = Int(readLine()!)!
var totalPrice = 0

for i in 0..<nums {
    let price = readLine()!.split(separator: " ").reduce(1) { Int(String($0))! * Int(String($1))! }
    totalPrice += price
}

receiptPrice == totalPrice ? print("Yes") : print("No")