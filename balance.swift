
func balancedBracket(str: String) -> Bool {

    guard !str.isEmpty else { return true }

    let brackets: [Character: Character] = [
        ")": "(",
        "]": "[",
        "}": "{",
        ">": "<"
    ]

    var opened: [Character] = []
    var used = false

    for l in str {
        if brackets.values.contains(l) {
            used = true
            if opened.contains(l) {
                return false
            }
            opened.append(l)
        } else {
            if brackets.keys.contains(l) {
                if let op = brackets[l],
                    let index = opened.firstIndex(of: op) {
                    opened.remove(at: index)
                }
            }
        }
    }
    return opened.isEmpty && used
}


//// experimentation
//struct MirrorDictionary<Key: Hashable, Value: Hashable>: ExpressibleByDictionaryLiteral {
//
//    private var fromLeftToRight: [Key: Value] = [:]
//    private var fromRightToLeft: [Value: Key] = [:]
//
//    init(dictionaryLiteral elements: (Key, Value)...) {
//        for element in elements {
//            fromLeftToRight[element.0] = element.1
//            fromRightToLeft[element.1] = element.0
//        }
//    }
//
//    subscript<K: Hashable>(key: K) -> some Hashable? {
//        get {
//            return fromLeftToRight[key] ?? fromRightToLeft[key] ?? nil
//        }
//    }
//}

// true
print("TRUE:")
print(balancedBracket(str: "()"))
print(balancedBracket(str: "([])"))
print(balancedBracket(str: "([])(<{}>)"))
print(balancedBracket(str: "([]{}<[{}]>)"))
print(balancedBracket(str: ""))

print("\nFALSE:")
print(balancedBracket(str: "}{"))
print(balancedBracket(str: "([)"))
print(balancedBracket(str: "(["))
print(balancedBracket(str: "[<<<{}>>]"))
print(balancedBracket(str: "hello"))
