import Foundation

extension Collection {
    func myMap<T>(transform: (Self.Element) -> T) -> [T] {
        var array: [T] = []
        array.reserveCapacity(count)

        for element in self {
            array.append(transform(element))
        }
        return array
    }
}
