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
    static func printChildren(from currentNode: Node.Type, spaces:String, deep: Int)
}

enum Action {
    case Up, Down
}

struct ActionItem {
    let action: Action
    let node: Node.Type
}


func pathToNodeFromRoot(destination destination:String, from currentNode: Node.Type) -> [Node.Type] {
    if currentNode.name == destination {
        return [currentNode]
    } else {
        for child in currentNode.children {
            let nodesFound = pathToNodeFromRoot(destination: destination, from: child)
            if nodesFound.count > 0 {
                return [currentNode] + nodesFound
            }
        }
        return []
    }
}

func pathBetweenNodes(destination destination:String, from currentNode: Node.Type, rootNode: Node.Type) -> [ActionItem] {
    let pathToA = pathToNodeFromRoot(destination: destination, from: currentNode)
    if pathToA.count == 0 {
        let pathToAFromRoot = pathToNodeFromRoot(destination: currentNode.name, from: rootNode)
        let pathToBFromRoot = pathToNodeFromRoot(destination: destination, from: rootNode)
        return buildPath(pathToAFromRoot, arrB: pathToBFromRoot)
    } else {
        return pathToA.map { ActionItem(action: .Down, node: $0) }
    }
}

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

func buildPath(arrA:[Node.Type], arrB: [Node.Type]) -> [ActionItem] {
    let (newA, newB) = dropCommonItems(a: arrA, b: arrB)
    let resA = newA.reverse().map { ActionItem(action: .Up, node: $0) }
    let resB = newB.map { ActionItem(action: .Down, node: $0) }
    
    return resA + resB
}


