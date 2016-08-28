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


extension Node {
    static func printChildren(from currentNode: Node.Type = Self.self, spaces:String = "", deep: Int = 0){
        let childSeparator = (0...deep).map { _ in return " |" }.joinWithSeparator("")
        let parentSeparator = (0..<deep).map { i in
            if i < deep - 1 {
                return " |"
            } else {
                return " "
            }}.joinWithSeparator("")
        
        if currentNode.children.count == 0 {
            print("\(childSeparator)--\(currentNode.name)")
        } else {
            print("\(parentSeparator)\\--\(currentNode.name)")
        }
        
        for child in currentNode.children {
            if child.children.count == 0 {
                printChildren(from: child, spaces: spaces + "   ", deep: deep)
            } else {
                printChildren(from: child, spaces: spaces + "   ", deep: deep + 1)
            }
        }
    }
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

func pathBetweenNodes(destination destination:String, from currentNode: Node.Type) -> [ActionItem] {
    let pathToA = pathToNodeFromRoot(destination: destination, from: currentNode)
    if pathToA.count == 0 {
        let pathToAFromRoot = pathToNodeFromRoot(destination: currentNode.name, from: S1.self)
        let pathToBFromRoot = pathToNodeFromRoot(destination: destination, from: S1.self)
        return buildPath(pathToAFromRoot, arrB: pathToBFromRoot)
    } else {
        return []
    }
}

func dropCommonItems(arrA:[Node.Type], arrB: [Node.Type]) -> ([Node.Type],[Node.Type]){
    var newA = arrA
    var newB = arrB
    
    let maxI = min(arrA.count, arrB.count)
    
    for i in (0..<maxI) {
        if arrA[i] == arrB[i] {
            newA = Array(newA.dropFirst())
            newB = Array(newB.dropFirst())
        }
    }
    
    return (newA, newB)
}

func buildPath(arrA:[Node.Type], arrB: [Node.Type]) -> [ActionItem] {
    let (newA, newB) = dropCommonItems(arrA, arrB: arrB)
    let resA = newA.reverse().map { ActionItem(action: .Up, node: $0) }
    let resB = newB.map { ActionItem(action: .Down, node: $0) }
    
    return resA + resB
}


