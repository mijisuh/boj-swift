var totalCredit: Float = 0
var totalGrade: Float = 0

while let input = readLine() {
    let inputArray = input.split { $0 == " " }
    if let credit = Float(inputArray[1]) {
        totalCredit += credit
        
        var grade: Float = 0
        
        switch inputArray[2] {
            case "A+":
            grade = 4.5
            case "A0":
            grade = 4.0
            case "B+":
            grade = 3.5
            case "B0":
            grade = 3.0
            case "C+":
            grade = 2.5
            case "C0":
            grade = 2.0
            case "D+":
            grade = 1.5
            case "D0":
            grade = 1.0
            case "F":
            grade = 0.0
            default:
            totalCredit -= credit
            break
        }
        
        totalGrade += credit * grade
    }
}

print(totalGrade/totalCredit)
