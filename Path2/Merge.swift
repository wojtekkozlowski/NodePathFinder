//
//  Merge.swift
//  Path2
//
//  Created by Wojtek Kozlowski on 28/08/2016.
//  Copyright © 2016 Wojtek Kozlowski. All rights reserved.
//

import Foundation

enum Action {
    case Pop,Push
}

struct ActionItem {
    let action: Action
    let node: Node.Type
}

func merge(arrA:[Node.Type], arrB: [Node.Type]) -> [ActionItem] {
    var newA = [Node.Type]()
    var newB = [Node.Type]()
    
    for (i,e) in arrA.enumerate(){
        if arrB[i] != e {
            newA.append(e)
            newB.append(arrB[i])
        }
    }
    
    let resA = newA.reverse().map { ActionItem(action: .Pop, node: $0) }
    let resB = newB.map { ActionItem(action: .Push, node: $0) }
    
    return resA + resB
}
