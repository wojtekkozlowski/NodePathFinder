//
//  NodePrinter.swift
//  Path2
//
//  Created by Wojtek Kozlowski on 28/08/2016.
//  Copyright © 2016 Wojtek Kozlowski. All rights reserved.
//

import Foundation

func printNodes(from currentNode: Node.Type, spaces:String, deep: Int = 0){
    let x = (0...deep).map { _ in return " |" }.joinWithSeparator("")
    let y = (0..<deep).map { i in
        if i < deep - 1 {
            return " |"
        } else {
            return " "
        }}.joinWithSeparator("")
    
    if currentNode.children.count == 0 {
        print("\(x)--\(currentNode.name)")
    } else {
        print("\(y)\\--\(currentNode.name)")
    }
    
    for child in currentNode.children {
        if child.children.count == 0 {
            printNodes(from: child, spaces: spaces + "   ", deep: deep)
        } else {
            printNodes(from: child, spaces: spaces + "   ", deep: deep + 1)
        }
    }
}

