// MARK: 방법 1)
if let input = readLine() {
    if let unicodeScalarValue = UnicodeScalar(input) {
        print(unicodeScalarValue.value)
    }
}

// MARK: 방법 2)
if let input = readLine() {
    if let asciiValue = Character(input).asciiValue {
        print(asciiValue)
    }
}

// MARK: 방법 3)
if let input = readLine() {
    if let unicodeScalar = Character(input).unicodeScalars.first {
        print(unicodeScalar.value)
    }
}
