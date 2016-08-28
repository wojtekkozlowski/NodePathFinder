//
//  main.swift
//  Path2
//
//  Created by Wojtek Kozlowski on 28/08/2016.
//  Copyright © 2016 Wojtek Kozlowski. All rights reserved.
//

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

func pathTo2(destination destination:String, from currentNode: Node.Type) -> [ActionItem] {
    let pathToA = pathTo(destination: destination, from: currentNode)
    if pathToA.count == 0 {
        let pathToAFromRoot = pathTo(destination: currentNode.name, from: A.self)
        let pathToBFromRoot = pathTo(destination: destination, from: A.self)
        return merge(pathToAFromRoot, arrB: pathToBFromRoot)
    } else {
        return []
    }
}

let result = pathTo2(destination: "ACC", from: AAA.self)
print(result)





