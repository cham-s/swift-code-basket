import Foundation

extension Collection where Self.Element: Comparable {
    func myMin() -> Self.Element? {
        guard var minimum = self.first  else { return nil }
        for e in self {
            if e < minimum {
                minimum = e
            }
        }
        return minimum
    }
}
