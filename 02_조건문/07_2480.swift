let inputs = readLine()!.split(separator: " ").map { Int($0)! }
let a = inputs[0]
let b = inputs[1]
let c = inputs[2]

if a == b && b == c {
    print(10000 + a * 1000)
} else if a == b || b == c {
    print(1000 + b * 100)
} else if a == c {
    print(1000 + a * 100)
} else {
    print(inputs.max()! * 100)
}


/*

[Array의 최댓값]
-> Array.max() (return 타입은 Int?)

*/