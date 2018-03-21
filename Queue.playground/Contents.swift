//: Playground - Generic Queue implementation

import UIKit

//  It is a wrapper around an array to enqueue, dequeue, and peek at the front-most item:

//  There are only a limited number of unused spots at the end of the array. When the last xxx gets used, and you want to add another item, the array needs to resize to make more room.

//  Resizing includes allocating new memory and copying all the existing data over to the new array. This is an O(n) process which is relatively slow. Since it happens occasionally, the time for appending a new element to the end of the array is still O(1) on average or O(1) "amortized".

//  The story for dequeueing is different. To dequeue, we remove the element from the beginning of the array. This is always an O(n) operation because it requires all remaining array elements to be shifted in memory.

public struct Queue<T> {
    fileprivate var list = [T]()
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        list.append(element)
    }
    
    public mutating func dequeue() -> T? {
        return list.removeFirst()
    }
    
    public func peek() -> T? {
        return list.first
    }
}


var queue = Queue<Int>()
queue.enqueue(10)
queue.enqueue(57)
queue.enqueue(3)

print(queue)
print(queue.isEmpty)
print("\nAfter Eequeue")
print(queue.list)

queue.dequeue()
queue.dequeue()
print("\nAfter Dequeue")
print(queue.list)

