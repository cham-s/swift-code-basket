import Foundation

extension Array where Self.Element: Numeric {
    var sum: Element { reduce(0, +) }
    var product: Element { reduce(0, *) }
}

let a1 = [1, 2, 3]
let a2 = [1.0, 2.0, 3.0]
let a3: [UInt8] = [1, 2, 3]

print(a1.sum)
print(a2.sum)
print(a3.sum)
