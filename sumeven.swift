import Foundation

func sumEven(values: Int...) -> Int {
    var numbersCount: [Int: Int] = [:]

    for v in values {
        numbersCount[v, default: 0] += 1
    }

    return numbersCount
        .reduce(0) { $1.value.isMultiple(of: 2) ? $0 + $1.key  : $0}
}
