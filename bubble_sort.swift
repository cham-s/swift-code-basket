import Foundation

extension Array where Self.Element: Comparable {
    mutating func bubbleSort()  {

        var swaped: Bool

        repeat {
            var index = 0
            swaped = false

            while index < count - 1 {
                if self[index] > self[index + 1] {
                    let tmp = self[index]
                    self[index] = self[index + 1]
                    self[index + 1] = tmp
                    swaped = true
                }
                index += 1
            }
        } while swaped
    }
}

var alpha = ["a", "b", "d", "c"]
var nums = [1, 4, 3, 6, 5, 2]

alpha.bubbleSort()
nums.bubbleSort()

print(alpha)
print(nums)

