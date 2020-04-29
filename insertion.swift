import Foundation

extension Array where Self.Element : Comparable {
    mutating func insertionSort() {
        for (lastSeenIndex, currentValue) in self.enumerated() {
            var movingIndex = lastSeenIndex
            while movingIndex - 1 >= 0 && self[movingIndex - 1] > currentValue {
                self[movingIndex] = self[movingIndex - 1]
                movingIndex -= 1
            }
            self[movingIndex] = currentValue
        }
    }
}

var result = [3, 2, 1, 3, 3, 4, 5, 1, 4, 6, 5, 8]
result.insertionSort()
print(result)
