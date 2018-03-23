//: Playground - noun: a place where people can play

import UIKit

class Node {
    var value: String
    var children: [Node] = []
    var parent: Node?
    
    init(value: String) {
        self.value = value
    }
    
    func add(child: Node) {
        children.append(child)
        child.parent = self
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        var text = "\(value)"
        
        if !children.isEmpty {
            text += " {" + children.map{$0.description}.joined(separator: ",") + "} "
        }
        return text
    }
}

extension Node {
    func search(value: String) -> Node? {
        if value == self.value {
            return self
        }
        
        for child in children {
            if let foundNode = child.search(value: value) {
                print(foundNode)
                return foundNode
            }
        }
        return nil
    }
}


let beverages = Node(value: "beverages")

let hotBeverages  = Node(value: "hot")
let coldBeverages = Node(value: "cold")

beverages.add(child: hotBeverages)
beverages.add(child: coldBeverages)
print(beverages)

print(beverages.search(value: "cold")!.value)
