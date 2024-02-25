let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]
var array = readLine()!.split(separator: " ").map { Int($0)! }
var count = 0
var result = -1

func mergeSort(_ array: inout [Int], _ p: Int, _ r: Int) {
    if p < r && count <= k {
        let q = (p + r) / 2
        // print(">> split")
        // print("left:", array[p...q])
        // print("right:", array[q+1...r])
        mergeSort(&array, p, q) // Left Split
        mergeSort(&array, q + 1, r) // Right Split
        merge(&array, p, q, r)
    }
}

func merge(_ array: inout [Int], _ p: Int, _ q: Int, _ r: Int) {
    // print(">> merge")
    var i = p, j = q + 1, tmp = [Int]()
    
    while i <= q && j <= r {
        if array[i] <= array[j] {
            tmp.append(array[i])
            i += 1
        } else {
            tmp.append(array[j])
            j += 1
        }
    }
    
    while i <= q {
        tmp.append(array[i])
        i += 1
    }
    
    while j <= r {
        tmp.append(array[j])
        j += 1
    }
    
    i = p
    var t = 0
    
    while i <= r {
        count += 1
        if count == k {
            result = tmp[t]
            break
        }
        
        array[i] = tmp[t]
        i += 1
        t += 1
    }
    
    // print("array: \(array)")
}

mergeSort(&array, 0, array.count - 1)
print(result)
