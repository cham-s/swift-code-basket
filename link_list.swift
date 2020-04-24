import Foundation

class LinkListNode<Element: CustomStringConvertible> {
    var element: Element
    var next: LinkListNode?
    
    init(element: Element) {
        self.element = element
    }
    
    convenience init (element: Element, next: LinkListNode) {
        self.init(element: element)
        self.next = next
    }
}

class List<T: CustomStringConvertible>: CustomStringConvertible {
    var description: String {
        var strArray = arrayForm.map { $0.description }
        strArray.append("NULL")
        return strArray.joined(separator: " -> ")
    }
    
    var head: LinkListNode<T>?
    private var tmp: LinkListNode<T>?
    
    var middle: LinkListNode<T>? {
        var slow = head
        var fast = head?.next
        
        while fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
    }
    
    init<C: Collection>(array: C) where C.Element == T {
        for element in array {
            if tmp == nil {
                tmp = LinkListNode(element: element)
                head = tmp
            } else {
                tmp?.next = LinkListNode(element: element)
                tmp = tmp?.next
            }
        }
    }
    
    func reversed() -> List {
        return List(array: Array(arrayForm.reversed()))
    }
    
    lazy var arrayForm: [T] = {
        var array: [T] = []
        
        tmp = head
        while let node = tmp {
            array.append(node.element)
            tmp = tmp?.next
        }
        
        return array
    }()
    
    func printList() {
        for e in arrayForm {
            print(e, terminator: "")
        }
        print("")
    }
}

let alphabet = "abcdefghijklmnopqrstuvwxyz"
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
let listAlpha = List(array: alphabet)
let listNumbers = List(array: numbers)

print("default order alphabet: \(listAlpha.description)")
print("reversed order: \(listAlpha.reversed().description)")
print("default order numbers: \(listNumbers.description)")
print("reversed order: \(listNumbers.reversed().description)")
