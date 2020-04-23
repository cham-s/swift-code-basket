import Foundation

extension Int {
    var isPositive: Bool {
        get { self > 0 }
    }
}

extension Array where Self.Element == Int {
    var biggestRange: ClosedRange<Int>? {
        get {
            guard !self.isEmpty else { return nil }

            var globalStart = 0
            var globalEnd = 0
            var globalTotal = 0
            var index = 0

            mainLoop: while index < self.indices.count {
                let localStart = index
                var localTotal = 0

                while self[index].isPositive {
                    localTotal += self[index]
                    index += 1
                    if index == self.indices.count {
                        if localTotal > globalTotal {
                            globalStart = localStart
                            globalEnd = index - 1
                        }
                        break mainLoop
                    }
                }
                if localTotal > globalTotal {
                    globalStart = localStart
                    globalEnd = index - 1
                    globalTotal = localTotal
                    localTotal = 0
                }
                index += 1
            }
            return globalStart...globalEnd
        }
    }
}

let result = [0, 1, 1, -1, 2, 3, 1].biggestRange
let result2 =  [10, 20, 30, -10, -20, 10, 20].biggestRange
let result3 = [1, -1, 2, -1].biggestRange
let result4 = [2, 0, 2, 0, 2].biggestRange
let result5 = [Int]().biggestRange

print(result ?? "nil")
print(result2 ?? "nil")
print(result3 ?? "nil")
print(result4 ?? "nil")
print(result5 ?? "nil")
