import Foundation

extension Int {
    var isNegative: Bool {
        get { self < 0 }
    }
}

extension Array where Self.Element == Int {
    var biggestRange: ClosedRange<Int> {
        get {
            var globalStart = 0
            var globalEnd = 0
            var globalTotal = 0
            var index = 0

            while index < self.indices.count {
                let element = self[index]
                if !element.isNegative {
                    var localStart = index
                    var localEnd = 0
                    var localTotal = 0

                    while !element.isNegative && index < self.indices.count  {
                        localTotal += element
                        index += 1
                    }
                    if localTotal > globalTotal {
                        globalStart =
                    }
                }
            }

        }
    }
}

