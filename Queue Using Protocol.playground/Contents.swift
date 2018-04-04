//: Playground - noun: a place where people can play

import UIKit

protocol ListSubscript {
    associatedtype AnyType
    
    var elements: [AnyType] { get }
}

extension ListSubscript {
    subscript(i: Int) -> Any {
        return elements[i]
    }
}

protocol ListPrintForwards {
    associatedtype AnyType
    var elements: [AnyType] { get }
}

extension ListPrintForwards {
    func showList() {
        if elements.count > 0 {
            var line = ""
            var index = 1
            for element in elements {
                line += "\(element) "
                index += 1
            }
            print("\(line)\n")
        } else {
            print("Empty\n")
        }
    }
}


protocol ListPrintBackwards {
    associatedtype AnyType
    var elements: [AnyType] { get }
}

extension ListPrintBackwards {
    func showList()  {
        if elements.count > 0 {
            var line = ""
            var index = 1
            for element in elements.reversed() {
                line += "\(element) "
                index += 1
            }
            print("\(line)\n")
        } else {
            print("Empty\n")
        }
    }
}


protocol ListCount {
    associatedtype AnyType
    var elements: [AnyType] { get }
}

extension ListCount {
    func count() -> Int {
        return elements.count
    }
}

protocol List {
    associatedtype AnyType
    var elements: [AnyType] { get set }
    mutating func remove() -> AnyType
    mutating func add(_ element: AnyType)
}

extension List {
    mutating func add(_ element: AnyType) {
        elements.append(element)
    }
}

//MARK: - Queue Implementation
protocol FIFO: List, ListCount, ListPrintForwards, ListSubscript {
}

extension FIFO {
    mutating func remove() -> AnyType {
        if elements.count > 0 {
            return elements.removeFirst()
        } else {
            return "****** Empty Queue *******" as! AnyType
        }
    }
}

struct Queue<AnyType>: FIFO {
    var elements: [AnyType] = []
}

//////// Example
var queue = Queue<Any>()
queue.add("A")
queue.add("A")
queue.add("b")
queue.add("d")
queue.add("u")
queue.add("l")
queue.remove()
queue.showList()


//MARK: - Stack Implementation
protocol LIFO: List, ListCount, ListPrintBackwards, ListSubscript {
    
}

extension LIFO {
    mutating func remove() -> AnyType {
        if elements.count > 0 {
            return elements.removeLast()
        } else {
            return "****** Empty Stack *******" as! AnyType
        }
    }
}

struct Stack<AnyType>: LIFO {
    var elements: [AnyType] = []
}

//////// Example
var stack = Stack<Any>()
stack.add("A")
stack.add("b")
stack.add("d")
stack.add("u")
stack.add("l")
stack.showList()
