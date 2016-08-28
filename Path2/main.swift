//
//  main.swift
//  Path2
//
//  Created by Wojtek Kozlowski on 28/08/2016.
//  Copyright © 2016 Wojtek Kozlowski. All rights reserved.
//

import Foundation

import Foundation

protocol Node {
    static var name: String {get}
    static var children: [Node.Type] {get}
}

func pathTo(destination destination:String, from currentNode: Node.Type) -> [Node.Type] {
    if currentNode.name == destination {
        return [currentNode]
    } else {
        for child in currentNode.children {
            let nodesFound = pathTo(destination: destination, from: child)
            if nodesFound.count > 0 {
                return [currentNode] + nodesFound
            }
        }
        return []
    }
}

let result = pathTo(destination: "ACB", from: A.self)
//printNodes(from: A.self, spaces: "")
print(result)



