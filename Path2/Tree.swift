//
//  Tree.swift
//  Path2
//
//  Created by Wojtek Kozlowski on 28/08/2016.
//  Copyright © 2016 Wojtek Kozlowski. All rights reserved.
//

import Foundation


struct A: Node {
    static let name = "A"
    static let children: [Node.Type] = [AA.self, AB.self, AC.self]
}

struct AA: Node  {
    static let name = "AA"
    static let children: [Node.Type] = [AAA.self,AAB.self, AAC.self]
}


struct AB: Node  {
    static let name = "AB"
    static let children: [Node.Type] = [ABA.self,ABB.self, ABC.self]
}

struct AC: Node  {
    static let name = "AC"
    static let children: [Node.Type] = [ACA.self,ACB.self, ACC.self]
}

struct AAA: Node  {
    static let name = "AAA"
    static let children: [Node.Type] = []
}

struct AAB: Node  {
    static let name = "AAB"
    static let children: [Node.Type] = []
}

struct AAC: Node  {
    static let name = "AAC"
    static let children: [Node.Type] = []
}


struct ABA: Node  {
    static let name = "ABA"
    static let children: [Node.Type] = []
}

struct ABB: Node  {
    static let name = "ABB"
    static let children: [Node.Type] = []
}

struct ABC: Node  {
    static let name = "ABC"
    static let children: [Node.Type] = []
}

struct ACA: Node  {
    static let name = "ACA"
    static let children: [Node.Type] = []
}

struct ACB: Node  {
    static let name = "ACB"
    static let children: [Node.Type] = []
}

struct ACC: Node  {
    static let name = "ACC"
    static let children: [Node.Type] = []
}







