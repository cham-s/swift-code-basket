import Foundation
extension Array where Self.Element == Int {
    var biggestRange: ClosedRange<Int> {
        get {
            var globalStart = 0
            var globalEnd = 0
            var globalTotal = 0
            var index = 0
            
            mainLoop: while index < self.indices.count {
                let localStart = index
                var localTotal = 0
                
                while !self[index].isNegative {
                    print(self[index])
                    localTotal += self[index]
                    index += 1
                    if index == self.indices.count {
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

