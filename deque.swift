import Foundationo

struct Deque<T>: CustomStringConvertible {
    private var array: [T] = []
    public var count: Int { array.count }
    
    public mutating func popFront() -> T? {
        guard let first = array.first else { return nil }
        array.removeFirst()
        return first
    }
    
    public mutating func popBack() -> T? {
       return array.popLast()
    }
    
    public mutating func pushFront(_ newElement: T) {
        var reversed = Array(array.reversed())
        reversed.append(newElement)
        array = Array(reversed.reversed())
    }
    
    public mutating func pushBack(_ newElement: T) {
        array.append(newElement)
    }
    
    var description: String { array.description }
}