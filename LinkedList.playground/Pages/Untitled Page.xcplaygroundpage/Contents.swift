//: [Previous](@previous)

import Foundation

//A linked list is a sequence of data items, where each item is referred to as a node.
//There are two main types of linked lists:
//Singly linked lists, are linked lists where each node only has a reference to the next node.
//Doubly linked lists, are linked lists where each node has a reference to the previous and next node.


public class Node {
    var value: String
    
    init(value: String) {
        self.value = value
    }
    
    var next: Node?
    var previous: Node?
}


public class LinkedList {
    fileprivate var head: Node?
    private var tail: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        return tail
    }
    
    
    /// Append new element in linkedlist
    ///
    /// - Parameter value: <#value description#>
    public func append(value: String) {
        let newNode = Node(value: value)
        
        if let tailNode = tail {
            tailNode.next = newNode
            newNode.previous = tailNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    
    /// Find specific node at given index
    ///
    /// - Parameter index: <#index description#>
    /// - Returns: <#return value description#>
    public func nodeAt(index: Int) -> Node? {
        var curr = head
        if index == 0 {
            return curr
        }
        for _ in 1...index {
            if curr != nil {
                curr = curr?.next
            }
        }
        return curr
    }
    
    public func remove(node: Node) -> String {
        
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        
        next?.previous = prev
        
        if next == nil {
            tail = prev
        }
        
        node.previous = nil
        node.next = nil
        return node.value
    }
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    public subscript(index: Int) -> Node? {
        var curr = head
        if index == 0 {
            return curr
        }
        for _ in 1...index {
            if curr != nil {
                 curr = curr?.next
            }
        }
        return curr
    }
    
    
    /// Insert Element at given index
    ///
    /// - Parameters:
    ///   - element: <#element description#>
    ///   - index: <#index description#>
    public func insert(element: String, index: Int) {
        let newNode = Node(value: element)
        
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
            let prevNode = nodeAt(index: index-1)
            let nextNode = prevNode?.next
            
            newNode.next = nextNode
            newNode.previous = prevNode
            
            prevNode?.next = newNode
            nextNode?.previous = newNode
        }
    }
}


extension LinkedList: CustomStringConvertible {
    public var description: String {
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node!.value)"
            node = node?.next
            
            if node != nil {
                text += ","
            }
        }
        
        return text + "]"
    }
}


// MARK: - Reverse Linked, list
extension LinkedList {
    
    func reverse() {
        var currentNode = head
        var prevNode: Node?
        var nextNode: Node?
        
        while currentNode != nil {
            nextNode = currentNode?.next
            currentNode?.next = prevNode
            prevNode = currentNode
            currentNode = nextNode
        }
        head = prevNode
    }
    
    //Reverse each word in a linked list node
    func reverseEachNodeValue() {
        var currentNode = head
        print("\n\n -------- Reverse each node value---------\n")
        while currentNode != nil {
            let words = currentNode!.value.components(separatedBy: " ")
            print(words)
            currentNode = currentNode?.next
        }
        print("\n -------- Reverse each node value---------\n\n")
    }
}


let dogBreeds = LinkedList()
dogBreeds.append(value: "Labrador")
dogBreeds.append(value: "Beagle")
dogBreeds.append(value: "Bulldog")
dogBreeds.append(value: "Husky")

print(dogBreeds)

print(dogBreeds.nodeAt(index: 3)?.value)
print(dogBreeds[3]?.value)


dogBreeds.reverse()
print(dogBreeds)


//dogBreeds.remove(node: dogBreeds[3]!)
//dogBreeds.insert(element: "Doggy", index: 4)
//print(dogBreeds)
