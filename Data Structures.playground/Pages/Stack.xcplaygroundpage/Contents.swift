
import Foundation


/// Stack
public struct Stack<T> {
    private var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public var top: T? {
        return array.last
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.removeLast()
    }
    
    public func peek() -> T? {
        return array.last
    }
}


//Examples
var stack = Stack<Any>()

stack.top
stack.peek()
stack.isEmpty

stack.push(10)
stack.push(12)
stack.push(13)
stack.push(14)
stack.push(15)
stack.push(17)
stack.push("Abdul")

stack.count
stack.top
stack.peek()
stack.pop()
stack.count
stack.isEmpty

