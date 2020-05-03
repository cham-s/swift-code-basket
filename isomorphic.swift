import Foundation

func isomorphic<V: CustomStringConvertible>(first: V, second: V) -> Bool {
    let alphanumericSet = CharacterSet.alphanumerics

    let firstFiltered = first.description.filter { char in
        let element = String(char)
        return element.rangeOfCharacter(from: alphanumericSet) != nil
    }
    let firstSet = Set(firstFiltered)

    let secondFiltered = second.description.filter { char in
        let element = String(char)
        return element.rangeOfCharacter(from: alphanumericSet) != nil
    }

    let secondSet = Set(secondFiltered)

    return firstSet.count == secondSet.count
}

func valuesDebug(checker: (CustomStringConvertible, CustomStringConvertible) -> Bool,
                    first: CustomStringConvertible, second: CustomStringConvertible,
                    expectedCondition: Bool,
                    message: String) {
    if expectedCondition {
        assert(checker(first, second), "\(first) and \(second) \(message)")
    } else {
        assert(!checker(first, second), "\(first) and \(second) \(message)")
    }
}

// true
print("exptected to be true")
print(isomorphic(first: "clap", second: "slap"))
print(isomorphic(first: "rum", second: "mud"))
print(isomorphic(first: "pip", second: "did"))
print(isomorphic(first: "carry", second: "baddy"))
print(isomorphic(first: "cream", second: "lapse"))
print(isomorphic(first: 123123, second: 456456))
print(isomorphic(first: 3.14159, second: 2.03048))
print(isomorphic(first:  [1, 2, 1, 2, 3], second: [4, 5, 4, 5, 6]))

// false
print("\nexpected to be false:")
print(isomorphic(first: "carry", second: "daddy"))
print(isomorphic(first: "did", second: "cad"))
print(isomorphic(first: "maim", second: "same"))
print(isomorphic(first: "curry", second: "flurry"))
print(isomorphic(first: 112233, second: 112211))
