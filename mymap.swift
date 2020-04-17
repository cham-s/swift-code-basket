import Foundation

extension Collection {
    func myMap<T>(transform: (Self.Element) throws -> T) rethrows -> [T] {
        var array: [T] = []
        array.reserveCapacity(count)

        for element in self {
            array.append(try transform(element))
        }
        return array
    }
}
