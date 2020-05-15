import Foundation

extension Array where Self.Element: Comparable {
    func quicksorted() -> [Self.Element] {
        var arrayCopy = self
        
        func quickSort(range: Range<Int>) {
            guard (range.upperBound + 1) - range.lowerBound > 1 else { return }
            var pivotIndex = range.lowerBound + range.upperBound / 2
            for currentIndex in arrayCopy.indices {
                if currentIndex > pivotIndex {
                    let tmpElement = arrayCopy[pivotIndex]
                    arrayCopy[pivotIndex] = arrayCopy[currentIndex]
                    arrayCopy[currentIndex] = tmpElement
                    pivotIndex = currentIndex
                }
            }
            // left side of the pivot
            quickSort(range: 0..<pivotIndex+1)
            // right side of the pivot
            quickSort(range: pivotIndex..<count)
        }
        
        quickSort(range: 0..<count)
        return arrayCopy
    }
}

