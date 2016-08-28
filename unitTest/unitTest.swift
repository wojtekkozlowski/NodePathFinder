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
    
    func testExample() {
        result = pathBetweenNodes(destination: "1_1_1_3", from: S1_1_1_1.self)
        assertActionItem(0, action: .Up, node: S1_1_1_1.self)
        assertActionItem(1, action: .Down, node: S1_1_1_3.self)
    }
    
    private func assertActionItem(idx: Int, action: Action, node: Node.Type){
        XCTAssert(result[idx].action == action)
        XCTAssert(result[idx].node == node)
    }
    
}
