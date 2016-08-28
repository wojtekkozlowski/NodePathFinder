//
//  NodePathFinder.swift
//  Path2
//
//  Created by Wojtek Kozlowski on 28/08/2016.
//  Copyright © 2016 Wojtek Kozlowski. All rights reserved.
//

import Foundation

protocol Node {
    static var name: String {get}
    static var children: [Node.Type] {get}
    static func pathTo(destination:String, from currentNode: Node.Type) -> [ActionItem]
}

enum Action {
    case Up, Down
}

struct ActionItem {
    let action: Action
    let node: Node.Type
}

extension Node {
    
    static func pathTo(destination:String) -> [ActionItem] {
        return self.pathTo(destination, from: Self.self)
    }
    
    private static func pathToChild(destination destination:String) -> [Node.Type] {
        return self.pathToChild(destination: destination, from: Self.self)
    }
    
    static func pathTo(destination:String, from currentNode: Node.Type) -> [ActionItem] {
        let pathToA = self.pathToChild(destination: destination, from: currentNode)
        if pathToA.count == 0 {
            //TODO: fix hardcoded root
            let pathToAFromRoot = S1.pathToChild(destination: currentNode.name)
            let pathToBFromRoot = S1.pathToChild(destination: destination)
            return buildPath(arrA: pathToAFromRoot, arrB: pathToBFromRoot)
        } else {
            return pathToA.map { ActionItem(action: .Down, node: $0) }
        }
    }
    
    private static func pathToChild(destination destination:String, from currentNode: Node.Type) -> [Node.Type] {
        if currentNode.name == destination {
            return [currentNode]
        } else {
            for child in currentNode.children {
                let nodesFound = pathToChild(destination: destination, from: child)
                if nodesFound.count > 0 {
                    return [currentNode] + nodesFound
                }
            }
            return []
        }
    }
    
    private static func buildPath(arrA arrA:[Node.Type], arrB: [Node.Type]) -> [ActionItem] {
        let (newA, newB) = dropCommonItems(a: arrA, b: arrB)
        let resA = newA.reverse().map { ActionItem(action: .Up, node: $0) }
        let resB = newB.map { ActionItem(action: .Down, node: $0) }
        
        return resA + resB
    }
}

//TODO: move to Zip2Sequence extension
func dropCommonItems(a a:[Node.Type], b: [Node.Type]) -> ([Node.Type],[Node.Type]){
    for (index, elementTuple) in zip(a, b).enumerate() {
        if elementTuple.0 != elementTuple.1 {
            let newA = Array(a[index..<a.count])
            let newB = Array(b[index..<b.count])
            return (newA, newB)
        }
    }
    return (a, b)
}



