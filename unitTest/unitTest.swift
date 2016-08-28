//
//  unitTest.swift
//  unitTest
//
//  Created by Wojtek Kozlowski on 28/08/2016.
//  Copyright © 2016 Wojtek Kozlowski. All rights reserved.
//

import XCTest

class unitTest: XCTestCase {
    
    var result: [ActionItem]!
    
    func testJustGoDownTheTree() {
        result = pathBetweenNodes(destination: "1_1_1_1", from: S1_1.self)
        assertActionItem(0, action: .Down, node: S1_1.self)
        assertActionItem(1, action: .Down, node: S1_1_1.self)
        assertActionItem(2, action: .Down, node: S1_1_1_1.self)
    }
    
    func testJustGoUpTheTree() {
        result = pathBetweenNodes(destination: "1_1", from: S1_1_1_1.self)
        assertActionItem(0, action: .Up, node: S1_1_1_1.self)
        assertActionItem(1, action: .Up, node: S1_1_1.self)
        assertActionItem(2, action: .Up, node: S1_1.self)
        
    }
    
    func testCommonNearest() {
        result = pathBetweenNodes(destination: "1_1_1_3", from: S1_1_1_1.self)
        assertActionItem(0, action: .Up, node: S1_1_1_1.self)
        assertActionItem(1, action: .Down, node: S1_1_1_3.self)
    }
    
    func testCommonMiddleWay() {
        result = pathBetweenNodes(destination: "1_1_2_2", from: S1_1_1_1.self)
        assertActionItem(0, action: .Up, node: S1_1_1_1.self)
        assertActionItem(1, action: .Up, node: S1_1_1.self)
        assertActionItem(2, action: .Down, node: S1_1_2.self)
        assertActionItem(3, action: .Down, node: S1_1_2_2.self)
    }
    
    func testCommonOnlyRoot() {
        result = pathBetweenNodes(destination: "1_3_3_3", from: S1_1_1_1.self)
        assertActionItem(0, action: .Up, node: S1_1_1_1.self)
        assertActionItem(1, action: .Up, node: S1_1_1.self)
        assertActionItem(2, action: .Up, node: S1_1.self)
        assertActionItem(3, action: .Down, node: S1_3.self)
        assertActionItem(4, action: .Down, node: S1_3_3.self)
        assertActionItem(5, action: .Down, node: S1_3_3_3.self)
    }
    
    private func assertActionItem(idx: Int, action: Action, node: Node.Type){
        XCTAssert(result[idx].action == action)
        XCTAssert(result[idx].node == node)
    }
    
}
