let inputX = Int(readLine()!)!
let inputY = Int(readLine()!)!

if (inputX > 0) {
    if (inputY > 0) {
        print("1")
    } else {
        print("4")
    }
} else {
    if (inputY > 0) {
        print("2")
    } else {
        print("3")
    }
}